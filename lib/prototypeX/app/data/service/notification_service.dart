import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/utils/logs_helper.dart';

class NotificationService {
  static final _messaging = FirebaseMessaging.instance;
  static bool _isInitialized = false;
  static bool _isStarted = false;
  static String? _token;
  static Function(String)? _onTokenRefreshCallback;

  ///notification plugin initialisation
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  ///notification channel to handle android notifications
  static const AndroidNotificationChannel _androidNotificationChannel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  ///notification channel to handle iOS notifications
  static const DarwinNotificationDetails _iOSNotificationChannel = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  static StreamSubscription<RemoteMessage>? _onMessageSubscription;
  static StreamSubscription<RemoteMessage>? _onMessageOpenedAppSubscription;

  ///ask permission from the user to display notifications
  static void requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      /// User has granted the notification permission
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      /// User has only granted the provisional permission
    } else {
      /// User has discarded the permission popup or denied the notification permission
    }
  }

  static void _handleNotificationResponsePayload(String? payload) {
    if (payload == null) return;

    LogsHelper.debugLog('notification payload from on did receive: $payload');
    final Map<String, dynamic> parsedData = jsonDecode(payload);

    LogsHelper.debugLog('Parsed notification data: $parsedData');

    // Construct a valid RemoteMessage object
    final remoteMessage = RemoteMessage(
      data: parsedData, // Pass parsed data directly
    );

    _handleBackgroundNotificationOnTap(remoteMessage);
  }

  static void _createAndroidNotificationChannel() async {
    /** we have created the android notification channel which
        we had specified in the AndroidManifest.xml file earlier */
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidNotificationChannel);
  }

  static void _showForegroundNotification(RemoteMessage message) async {
    logger.e("FirebaseMessaging.onMessage.listen ${message.data} /${message.notification} ");
    if (Platform.isIOS) {
      return;
    }
    RemoteNotification? notification = message.notification;

    if (notification != null) {
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidNotificationChannel.id,
            _androidNotificationChannel.name,
            channelDescription: _androidNotificationChannel.description,
            color: AppColor.blue0xFF2445CD,
            styleInformation: const BigTextStyleInformation(''),
          ),
          iOS: _iOSNotificationChannel,
        ),
        payload: jsonEncode(message.data),
      );
    }
  }

  static void _handleBackgroundNotificationOnTap(RemoteMessage message) async {
    logger.e("FirebaseMessaging.onMessageOpenedApp.listen");

    RemoteNotification? notification = message.notification;
    // DialogHelper.showMessage("${notification?.title} ${message.data}");
    if (notification != null) {
      LogsHelper.debugLog('Notification clicked: ${notification.title}');
    }
    LogsHelper.debugLog('Notification clicked data: ${message.data}');
    final data = message.data;
    logger.d(data.toString());

    // Define the action to perform when the user taps on the notification
  }

  static Future<void> getFCMToken() async {
    final token = await _messaging.getToken();
    if (_token != token) {
      _token = token;
    }
    logger.e(token);
    LogsHelper.debugLog('FCM Token: $_token');
  }

  static void _configureLocalNotificationPlugin() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_notification_icon');

    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      ),
      onDidReceiveNotificationResponse: (response) {
        LogsHelper.debugLog('onDidReceiveNotificationResponse :: $response}');
        _handleNotificationResponsePayload(response.payload);
      },
    );

    /** Update the iOS foreground notification presentation options to allow
        heads up notifications. */
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Future<void> init() async {
    if (_isInitialized) return;

    _isInitialized = true;

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      logger.d("initial Message");
      _handleBackgroundNotificationOnTap(initialMessage);
    }

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    _handleNotificationResponsePayload(notificationAppLaunchDetails?.notificationResponse?.payload);

    ///onTokenRefresh stream allows us to listen to the token value whenever it changes
    _messaging.onTokenRefresh.listen((newValue) {
      logger.d(newValue);
      _token = newValue;
      _onTokenRefreshCallback?.call(newValue);
    });

    LogsHelper.debugLog('FCM Token: ${getFCMToken()}');
  }

  static Future<void> start() async {
    if (_isStarted) return;
    _isStarted = true;
    requestPermission();
    // getFCMToken();
    _configureLocalNotificationPlugin();
    _createAndroidNotificationChannel();

    /// Foreground notification handler
    _onMessageSubscription = FirebaseMessaging.onMessage.listen(_showForegroundNotification);

    /// Background notification handler
    _onMessageOpenedAppSubscription = FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundNotificationOnTap);
  }

  static Future<void> stop() async {
    _onMessageSubscription?.cancel();
    _onMessageOpenedAppSubscription?.cancel();
    _isStarted = false;
  }

  static clearNotifications() {
    try {
      _flutterLocalNotificationsPlugin.cancelAll();
    } catch (e) {
      LogsHelper.debugLog('clearNotifications :: $e');
    }
  }

  static clearNotificationType() async {
    try {
      if (Platform.isIOS) {
        clearNotifications();
      } else {
        var notificationList = await _flutterLocalNotificationsPlugin.getActiveNotifications();

        notificationList.forEach(
              (element) {
            LogsHelper.debugLog('clearNotification : ${element.id} ${element.payload} ${element.body} ${element.title}');
            if (element.title == 'Event Created') {
              if (element.id != null) {
                _flutterLocalNotificationsPlugin.cancel(element.id!);
              }
            }
          },
        );
      }
    } catch (e) {
      LogsHelper.debugLog('clearNotificationS :: $e');
    }
  }
}

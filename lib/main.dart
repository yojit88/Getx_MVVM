import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/app/data/clients/dio_remote_api_client.dart';
import 'package:getx_testing/prototypeX/app/data/service/notification_service.dart';
import 'package:getx_testing/prototypeX/app/routes/routes.dart';
import 'package:getx_testing/prototypeX/app/module/loading/loading.dart';
import 'package:getx_testing/prototypeX/core/theme/app_color.dart';
import 'package:getx_testing/prototypeX/core/values/app_routes_name.dart';
import 'package:getx_testing/prototypeX/core/values/app_strings.dart';
import 'prototypeX/core/utils/shared_prefrences_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final result = await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.white).copyWith(
        extensions: [
          AppColors.light(),
        ],
      ),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.routes,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: Language(),
    );
  }
}

Future<void> setupDependencies() async {
  await SharedPreferenceHelper.init();
  // Define Loading Service
  LoadingService loadingService = LoadingService();
  await NotificationService.init();
  Get.put<LoadingService>(loadingService);
  Get.lazyPut(() => DioRemoteApiClient());
}

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../utils/shared_prefrences_helper.dart';

class AppConstants {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final tooltipKey = GlobalKey();

  static final pageRecordLimit = 25;
  static List<String> monthFilterList = ['3', '6', '9', '12'];
  static const String textPlaceHolder = "--";
  static const int descriptionTrimLines = 5;
  static const int paginationDataLimit = 10;

  static setAppVersion() async {
    try {
      await SharedPreferenceHelper.setString(PreferenceKeys.appVersion,
          (await PackageInfo.fromPlatform()).version);
    } catch (e) {}
  }

  static Future<String?> getAppVersion() async {
    try {
      return SharedPreferenceHelper.getString(PreferenceKeys.appVersion) ??
          (await PackageInfo.fromPlatform()).version;
    } catch (e) {
      return null;
    }
  }

}
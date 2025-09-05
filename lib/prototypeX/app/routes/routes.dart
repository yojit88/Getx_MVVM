import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/app/view/splash/splash_screen.dart';

import '../../core/values/constants/app_routes_name.dart';

class AppPages {

  const AppPages._();

  static final routes = [
    GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen(),)
  ];

}
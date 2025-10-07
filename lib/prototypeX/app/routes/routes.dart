import 'package:get/get.dart';
import '../../core/values/app_routes_name.dart';
import '../module/module.dart';

class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: AppRoutes.dashBoardScreen,
      page: () => DashboardScreen(),
    ),
  ];
}

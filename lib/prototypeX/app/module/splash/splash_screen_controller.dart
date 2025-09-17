import 'package:get/get.dart';
import '../../../core/values/app_routes_name.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  void navigate() async {
    const Duration duration = Duration(milliseconds: 1500);

    await Future.delayed(
      duration,
      () {
        Get.offAllNamed(AppRoutes.loginScreen);
      },
    );
  }
}

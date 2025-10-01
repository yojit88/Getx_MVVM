import 'package:get/get.dart';
import '../../../core/utils/shared_prefrences_helper.dart';
import '../../../core/values/app_routes_name.dart';
import '../../data/clients/dio_remote_api_client.dart';
import '../base/base_controller.dart';
import '../loading/loading.dart';

class SplashScreenController extends GetxController {
  static const Duration duration = Duration(milliseconds: 1500);

  @override
  void onInit() {
    super.onInit();
    setupDependencies();
  }

  void navigate() async {
    await Future.delayed(
      duration,
      () {
        Get.offAllNamed(AppRoutes.dashBoardScreen);
      },
    );
  }

  Future<void> setupDependencies() async {
    await SharedPreferenceHelper.init();
    // Define Loading Service
    LoadingService loadingService = LoadingService();
    Get.put((BaseClassController()));
    Get.put<LoadingService>(loadingService);
    Get.lazyPut(() => DioRemoteApiClient());
    navigate();
  }
}

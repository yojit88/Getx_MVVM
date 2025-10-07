import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/app/data/service/notification_service.dart';

import '../../../core/utils/logs_helper.dart';

class DashboardScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    NotificationService.start();
    testing();
  }

  void testing() async {
    logger.f("Testing");
    // NotificationService.getFCMToken();
  }
}

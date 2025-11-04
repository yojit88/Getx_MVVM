import 'package:get/get.dart';

import '../base/base_controller.dart';

class DashboardScreenController extends GetxController {

  DashboardScreenController({this.customScreenSize});

  BaseClassController? customScreenSize;

  double customSize(double num) {
    // Returns the modified size value after applying the custom logic
    return num * 1.5;
  }

  void screenCustom(){
    customScreenSize!.width=44;
    customScreenSize!.height=44;
  }
}

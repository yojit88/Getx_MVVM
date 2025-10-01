import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/logs_helper.dart' show logger;
import '../../../core/values/app_sizes.dart';

class BaseClassController extends GetxService with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _updateSize(); // set initial values
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    // Called every time screen/window size changes
    _updateSize();
  }

  static bool isMobile(BuildContext context) {
    return context.isPhone;
  }

  void _updateSize() {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    logger.e(isMobile(Get.context!));
    logger.e(view.physicalSize.width);
    final logicalWidth = view.physicalSize.width / view.devicePixelRatio;
    final logicalHeight = view.physicalSize.height / view.devicePixelRatio;

    logger.i("Screen size changed: $logicalWidth x $logicalHeight "
        "From Screen:${Get.currentRoute} Orientation ${view.physicalSize.width > view.physicalSize.height ? "landscape" : "portraitl"}");

    AppSizes.deviceWidth = logicalWidth;
    AppSizes.deviceHeight = logicalHeight;
    AppSizes.deviceWidthRatio = logicalWidth / AppSizes.mobileBaseWidth;
    AppSizes.deviceHeightRatio = logicalHeight / AppSizes.mobileBaseHeight;
  }
}

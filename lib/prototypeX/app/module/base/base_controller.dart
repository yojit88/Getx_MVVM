import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_sizes.dart';
import '../../data/types/layout_types.dart';

class BaseClassController extends GetxService with WidgetsBindingObserver {
  late double width;
  late double height;
  late double logicalWidth;
  late double logicalHeight;

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

    if (view.physicalSize.width < view.physicalSize.height) {
      logicalWidth = view.physicalSize.width / view.devicePixelRatio;
      logicalHeight = view.physicalSize.height / view.devicePixelRatio;
    } else {
      logicalWidth = view.physicalSize.height / view.devicePixelRatio;
      logicalHeight = view.physicalSize.width / view.devicePixelRatio;
    }

    if (logicalWidth.d2 < 600) {
      // Mobile
      width = AppSizes.mobileBaseWidth;
      height = AppSizes.mobileBaseHeight;
      AppSizes.deviceSize = DeviceSize.mobile;
    } else if (logicalWidth.d2 >= 600 && logicalWidth.d2 < 720) {
      // Medium Tablet
      width = AppSizes.mTabletBaseWidth;
      height = AppSizes.mTabletBaseHeight;
      AppSizes.deviceSize = DeviceSize.mediumTablet;
    } else if (logicalWidth.d2 >= 720 && logicalWidth.d2 < 900) {
      // Large Tablet
      width = AppSizes.lTabletBaseWidth;
      height = AppSizes.lTabletBaseHeight;
      AppSizes.deviceSize = DeviceSize.largeTablet;
    }

    AppSizes.deviceWidth = logicalWidth;
    AppSizes.deviceHeight = logicalHeight;
    AppSizes.deviceWidthRatio = logicalWidth / width; // DeviceWidth/base width
    AppSizes.deviceHeightRatio = logicalHeight / height;
  }
}

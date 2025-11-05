import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class ScreenUtil {
  /// Compares the device size with the given [baseWidth] and [baseHeight].
  /// Returns a map with percentage differences.
  static Map<String, double> compareSize() {
    final size = MediaQuery.of(Get.context!).size;
    final deviceWidth = size.width;
    final deviceHeight = size.height;

    double widthDiff = ((deviceWidth - 356.00) / 356.00) * 100;
    double heightDiff = ((deviceHeight - 756.00) / 756.00) * 100;

    return {
      "widthDiff": widthDiff, // +ve means wider, -ve means narrower
      "heightDiff": heightDiff, // +ve means taller, -ve means shorter
    };
  }
}

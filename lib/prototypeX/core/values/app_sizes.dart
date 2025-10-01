// Base - figma design pixels
import 'dart:io';
import 'dart:math' as math;
import '../utils/logs_helper.dart';

class AppSizes {
  // Width and height values based on Figma design specifications
  static const double mobileBaseWidth = 600.00; // 600
  static const double mobileBaseHeight = 912.00; // 912

  // static const double mTabletBaseWidth = 600.00; // 600
  // static const double mTabletBaseHeight = 912.00; // 912
  //
  // static const double lTabletBaseWidth = 600.00; // 600
  // static const double lTabletBaseHeight = 912.00; // 912
  // Device size (mutable)
  static double _deviceWidth = 0.00;
  static double _deviceHeight = 0.00;
  static double _deviceWidthRatio = 0.00;
  static double _deviceHeightRatio = 0.00;

  // Getter
  static double get deviceWidth => _deviceWidth;

  static double get deviceHeight => _deviceHeight;

  static double get deviceWidthRatio => _deviceWidthRatio;

  static double get deviceHeightRatio => _deviceHeightRatio;

  // Setter
  static set deviceWidth(double value) => _deviceWidth = value;

  static set deviceHeight(double value) => _deviceHeight = value;

  static set deviceWidthRatio(double value) => _deviceWidthRatio = value;

  static set deviceHeightRatio(double value) => _deviceHeightRatio = value;

  static const double dimenToPx1 = 1.00;
  static const dimenToPx1Point5 = 1.50;
  static const dimenToPx2 = 2.0;
  static const dimenToPx3 = 3.0;
  static const dimenToPx4 = 4.0;
  static const dimenToPx5 = 5.0;
  static const dimenToPx6 = 6.0;
  static const dimenToPx6Point5 = 6.5;
  static const dimenToPx7 = 7.0;
  static const dimenToPx8 = 8.0;
  static const dimenToPx9 = 9.0;
  static const dimenToPx10 = 10.0;
  static const dimenToPx11 = 11.0;
  static const dimenToPx12 = 12.0;
  static const dimenToPx13 = 13.0;
  static const dimenToPx14 = 14.0;
  static const dimenToPx15 = 15.0;
  static const dimenToPx16 = 16.0;
  static const dimenToPx17 = 17.0;
  static const dimenToPx18 = 18.0;
  static const dimenToPx19 = 19.0;
  static const dimenToPx20 = 20.0;
  static const dimenToPx22 = 22.0;
  static const dimenToPx23 = 23.0;
  static const dimenToPx24 = 24.0;
  static const dimenToPx25 = 25.0;
  static const dimenToPx26 = 26.0;
  static const dimenToPx27 = 27.0;
  static const dimenToPx28 = 28.0;
  static const dimenToPx29 = 29.0;
  static const dimenToPx30 = 30.0;
  static const dimenToPx31 = 31.0;
  static const dimenToPx32 = 32.0;
  static const dimenToPx33 = 33.0;
  static const dimenToPx34 = 34.0;
  static const dimenToPx35 = 35.0;
  static const dimenToPx36 = 36.0;
  static const dimenToPx38 = 38.0;
  static const dimenToPx40 = 40.0;
  static const dimenToPx42 = 42.0;
  static const dimenToPx44 = 44.0;
  static const dimenToPx45 = 45.0;
  static const dimenToPx80 = 80.0;
  static const dimenToPx82 = 82.0;
  static const dimenToPx86 = 86.0;
  static const dimenToPx90 = 90.0;
  static const dimenToPx92 = 92.0;
  static const dimenToPx94 = 94.0;
  static const dimenToPx98 = 98.0;
  static const dimenToPx100 = 100.00;
}

class AppTextSizes {
  static const text12 = AppSizes.dimenToPx12;
  static const text13 = AppSizes.dimenToPx13;
  static final text14 = AppSizes.dimenToPx14;
  static final text15 = AppSizes.dimenToPx15;
  static final text16 = AppSizes.dimenToPx16;
  static final text18 = AppSizes.dimenToPx18;
  static final text20 = AppSizes.dimenToPx20;
  static final text22 = AppSizes.dimenToPx22;
  static final text23 = AppSizes.dimenToPx23;
  static final text26 = AppSizes.dimenToPx26;
  static final text32 = AppSizes.dimenToPx32;
}

extension DoubleExtensions on double {
  // Returns a scaled width value based on the device width ratio.
  double get wc {
    logger.w("Width ${this * AppSizes.deviceWidthRatio} WidthRatio ${AppSizes.deviceWidthRatio}");

    return this * AppSizes.deviceWidthRatio;
  }

  // Returns a scaled height value based on the device height ratio.
  double get hc {
    logger.d("Height ${this * AppSizes.deviceHeightRatio}  HeightRatio ${AppSizes.deviceHeightRatio}");
    return this * AppSizes.deviceHeightRatio;
  }

  // Returns the number rounded to two decimal places.
  double get d2 {
    return double.parse(toStringAsFixed(2));
  }

  // Returns a responsive scale factor based on both
  double get rs {
    logger.i(
        "RS ${(this * math.pow(AppSizes.deviceWidthRatio, 0.5) * math.pow(AppSizes.deviceHeightRatio, 0.5)).toDouble()}");
    return this * (math.pow(AppSizes.deviceWidthRatio, 0.5) * math.pow(AppSizes.deviceHeightRatio, 0.5)).toDouble();
  }

  double pfs({required double androidFs, required double iosFs}) {
    if (Platform.isAndroid) {
      return androidFs;
    } else if (Platform.isIOS) {
      return iosFs;
    }
    return this; // fallback to original size if not Android/iOS
  }

  double cfs(double Function(double value) testing) {
    return testing(this);
  }
}

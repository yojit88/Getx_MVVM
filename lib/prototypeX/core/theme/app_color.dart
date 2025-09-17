import 'package:flutter/material.dart';

class AppColor {
  static const Color white = Colors.white;

  //temp
  static const Color dark = Color(0x22000000);

  static const Color black = Colors.black;
  static const Color trBlack0x22000000 = Color(0x22000000);
  static const Color black0xFF222222 = Color(0xFF222222);
  static const Color black0xFF292929 = Color(0xFF292929);
  static const Color black0xFFF7F8FA = Color(0xFF292929);
  static const Color black0x42000000 = Color(0x42000000);

  static const Color blue0xFF6782E0 = Color(0xFF6782E0);
  static const Color blue0xFF98ADF4 = Color(0xFF98ADF4);
  static const Color blue0xFF686E93 = Color(0xFF686E93);
  static const Color blue0xFF3267F2 = Color(0xFF3267F2);
  static const Color blue0x332445CD = Color(0x332445CD);
  static const Color blue0xFF2445CD = Color(0xFF2445CD);

  static const Color grey0xFFEFEFEF = Color(0xFFEFEFEF);
  static const Color grey0xFFF2F5F8 = Color(0xFFF2F5F8);
  static const Color grey0xFF707070 = Color(0xFF707070);
  static const Color grey0xFFF7F8FA = Color(0xFFF7F8FA);
  static const Color grey0xFFF0F0F0 = Color(0xFFF0F0F0);
  static const Color grey0xFFEDEDED = Color(0xFFEDEDED);
  static const Color grey0xFFA9A9A9 = Color(0xFFA9A9A9);
  static const Color grey0xFF909090 = Color(0xFF909090);
  static const Color grey0xFFEDEEF0 = Color(0xFFEDEEF0);

  static const Color green0xFFAFD79C = Color(0xFFAFD79C);
  static const Color green0xFF55AC69 = Color(0xFF55AC69);

  static const Color red0xFFE43D3D = Color(0xFFE43D3D);

  static const Color red0xFFEF4444 = Color(0xFFEF4444);
  static const Color purple0xFFB749FB = Color(0xFFB749FB);
  static const Color purple0xFF7B68EE = Color(0xFF7B68EE);
  static const Color purple0xFF5837DD = Color(0xFF5837DD);
  static const Color blue0xFF6781E0 = Color(0xFF6781E0);

  static const Color orange0xFFF89D32 = Color(0xFFF89D32);
  static const Color orange0xFFF59E0B = Color(0xFFF59E0B);

  static const Color yellow0xFFF6D24E = Color(0xFFF6D24E);

  static const Color pink0xFFB749FB = Color(0xFFB749FB);

  static const Color transparent = Colors.transparent;

  static const Color black0xFF333333 = Color(0xFF333333);

  static const Color red0xFFF12D2D = Color(0xFFF12D2D);
}

class AppColors extends ThemeExtension<AppColors> {
  static AppColors getInstance(BuildContext context) {
    return Theme.of(context).extension<AppColors>()!;
  }

  //Spend Analysis colors
  final Color primaryColor;
  final Color onPrimaryColor;
  final Color colorOnBackground;
  final Color dividerColor;
  final Color bgImageColor;
  final Color errorColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color colorOnSurface;
  final Color primaryContainer;
  final Color colorOnPrimary;
  final Color colorOnBackgroundSecondary;
  final Color selectItemColor;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color hintTextColor;
  final Color borderColor;
  final Color onSecondaryContainerVariant;
  final Color graphDotBorderColor;
  final Color tableHeaderBgColor;
  final Color tableHeaderTextColor;
  final Color disableColor;
  final Color disableTextColor;
  final Color budgetColor;

  //Snapshot colors
  final Color colorSubText;
  final Color colorTableHeader;
  final Color colorGradientButton;
  final Color colorTransparent;
  final Color colorDisableText;
  final Color colorBackArrow;
  final Color colorChartIndicatorYellow;
  final Color colorChartIndicatorOrange;
  final Color colorChartIndicatorGreen;
  final Color colorChartIndicatorBlue;

  //Call Analysis colors
  final Color unselectedTabColor;
  final Color statesColor;
  final Color barGraphColor;
  final Color tableBorderColor;
  final Color searchHintColor;
  final Color colorChartIndicatorPurple;
  final Color colorChartIndicatorLightBlue;

  // Patient Colors
  final Color bgPatientColor;
  final Color searchIconColor;
  final Color searchBgColor;
  final Color tableListColor;

  //Account colors
  final Color colorChartIndicatorRed;
  final Color colorShadow;

  final Color colorBgImg;
  final Color colorTextProfile;

  AppColors(
      //Spend Analysis colors
      this.primaryColor,
      this.onPrimaryColor,
      this.colorOnBackground,
      this.primaryContainer,
      this.dividerColor,
      this.bgImageColor,
      this.errorColor,
      this.surfaceColor,
      this.backgroundColor,
      this.colorOnSurface,
      this.colorOnPrimary,
      this.colorOnBackgroundSecondary,
      this.selectItemColor,
      this.secondaryContainer,
      this.onSecondaryContainer,
      this.hintTextColor,
      this.borderColor,
      this.disableColor,
      this.disableTextColor,
      this.onSecondaryContainerVariant,
      this.graphDotBorderColor,
      this.tableHeaderBgColor,
      this.tableHeaderTextColor,
      this.budgetColor,
      this.colorBgImg,
      this.colorTextProfile,

      //Snapshot colors
      this.colorSubText,
      this.colorTableHeader,
      this.colorGradientButton,
      this.colorTransparent,
      this.colorDisableText,
      this.colorBackArrow,
      this.colorChartIndicatorYellow,
      this.colorChartIndicatorOrange,
      this.colorChartIndicatorGreen,
      this.colorChartIndicatorBlue,

      //Call Analysis colors
      this.unselectedTabColor,
      this.statesColor,
      this.barGraphColor,
      this.tableBorderColor,
      this.searchHintColor,
      this.colorChartIndicatorPurple,
      this.colorChartIndicatorLightBlue,

      //Patient colors
      this.bgPatientColor,
      this.searchIconColor,
      this.searchBgColor,
      this.tableListColor,

      //Account colors
      this.colorChartIndicatorRed,
      this.colorShadow);

  AppColors.light({
    //Spend Analysis colors
    this.primaryColor = AppColor.blue0xFF6782E0,
    this.primaryContainer = AppColor.blue0xFF98ADF4,
    this.onPrimaryColor = AppColor.white,
    this.colorOnBackground = AppColor.black0xFF222222,
    this.dividerColor = AppColor.grey0xFFEFEFEF,
    this.bgImageColor = AppColor.green0xFFAFD79C,
    this.errorColor = AppColor.red0xFFE43D3D,
    this.surfaceColor = AppColor.white,
    this.backgroundColor = AppColor.grey0xFFF2F5F8,
    this.colorOnSurface = AppColor.black,
    this.colorOnPrimary = AppColor.white,
    this.colorOnBackgroundSecondary = AppColor.blue0xFF686E93,
    this.selectItemColor = AppColor.grey0xFFF7F8FA,
    this.secondaryContainer = AppColor.grey0xFFF7F8FA,
    this.onSecondaryContainer = AppColor.black,
    this.hintTextColor = AppColor.grey0xFFEFEFEF,
    this.borderColor = AppColor.grey0xFFF0F0F0,
    this.disableColor = AppColor.grey0xFFEFEFEF,
    this.disableTextColor = AppColor.grey0xFFA9A9A9,
    this.onSecondaryContainerVariant = AppColor.grey0xFF707070,
    this.graphDotBorderColor = AppColor.grey0xFFEFEFEF,
    this.tableHeaderBgColor = AppColor.grey0xFFF7F8FA,
    this.tableHeaderTextColor = AppColor.grey0xFF707070,
    this.budgetColor = AppColor.pink0xFFB749FB,
    this.colorBgImg = AppColor.blue0x332445CD,
    this.colorTextProfile = AppColor.blue0xFF2445CD,

    // Snapshot colors
    this.colorSubText = AppColor.grey0xFF707070,
    this.colorTableHeader = AppColor.grey0xFFF7F8FA,
    this.colorGradientButton = AppColor.blue0xFF98ADF4,
    this.colorTransparent = AppColor.transparent,
    this.colorDisableText = AppColor.grey0xFFA9A9A9,
    this.colorBackArrow = AppColor.black0xFF292929,
    this.colorChartIndicatorYellow = AppColor.yellow0xFFF6D24E,
    this.colorChartIndicatorOrange = AppColor.orange0xFFF89D32,
    this.colorChartIndicatorGreen = AppColor.green0xFF55AC69,
    this.colorChartIndicatorBlue = AppColor.blue0xFF3267F2,

    // Call Analysis colors
    this.unselectedTabColor = AppColor.grey0xFF707070,
    this.statesColor = AppColor.purple0xFFB749FB,
    this.barGraphColor = AppColor.purple0xFF7B68EE,
    this.tableBorderColor = AppColor.grey0xFFEDEDED,
    this.searchHintColor = AppColor.grey0xFF909090,
    this.colorChartIndicatorPurple = AppColor.purple0xFFB749FB,
    this.colorChartIndicatorLightBlue = AppColor.blue0xFF6781E0,

    // Patient Module Colors
    this.bgPatientColor = AppColor.grey0xFFF7F8FA,
    this.searchIconColor = AppColor.black0xFFF7F8FA,
    this.searchBgColor = AppColor.grey0xFFEDEEF0,
    this.tableListColor = AppColor.black0xFF333333,

    //Account colors
    this.colorChartIndicatorRed = AppColor.red0xFFF12D2D,
    this.colorShadow = AppColor.black0x42000000,
  });

  @override
  ThemeExtension<AppColors> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other,
      double t,
      ) {
    return AppColors(
      primaryColor,
      onPrimaryColor,
      colorOnBackground,
      primaryContainer,
      dividerColor,
      bgImageColor,
      errorColor,
      surfaceColor,
      backgroundColor,
      colorOnSurface,
      colorOnPrimary,
      colorOnBackgroundSecondary,
      selectItemColor,
      secondaryContainer,
      onSecondaryContainer,
      hintTextColor,
      borderColor,
      disableColor,
      disableTextColor,
      onSecondaryContainerVariant,
      graphDotBorderColor,
      tableHeaderBgColor,
      tableHeaderTextColor,
      budgetColor,
      colorSubText,
      colorTableHeader,
      colorGradientButton,
      colorTransparent,
      colorDisableText,
      colorBackArrow,
      colorChartIndicatorYellow,
      colorChartIndicatorOrange,
      colorChartIndicatorGreen,
      colorChartIndicatorBlue,
      unselectedTabColor,
      statesColor,
      barGraphColor,
      tableBorderColor,
      searchHintColor,
      bgPatientColor,
      searchIconColor,
      searchBgColor,
      colorChartIndicatorPurple,
      colorChartIndicatorLightBlue,
      tableListColor,
      colorChartIndicatorRed,
      colorShadow,
      colorBgImg,
      colorTextProfile,
    );
  }
}

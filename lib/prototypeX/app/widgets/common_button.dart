  import 'package:flutter/material.dart';

  import '../../core/theme/app_color.dart';
  import '../../core/theme/app_text_style.dart';
  import '../../core/values/app_sizes.dart';

  class CommonButton extends StatelessWidget {
    const CommonButton({
      super.key,
      required this.text,
      required this.onTap,
      this.padding,
      this.isEnable = true,
    });

    final String text;
    final EdgeInsets? padding;
    final Function() onTap;
    final bool isEnable;

    @override
    Widget build(BuildContext context) {
      final AppColors colors = AppColors.getInstance(context);
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (isEnable) {
            onTap();
          }
        },
        child: Container(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: AppSizes.dimenToPx10,
                vertical: AppSizes.dimenToPx8,
              ),
          decoration: isEnable
              ? ShapeDecoration(
            color: colors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.dimenToPx12),
            ),
          )
              : ShapeDecoration(
            color: colors.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.dimenToPx12),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.primaryTextRegularW400.copyWith(
                color: isEnable
                    ? colors.colorOnPrimary
                    : colors.colorOnBackgroundSecondary,
                fontSize: AppTextSizes.text16,
              ),
            ),
          ),
        ),
      );
    }
  }

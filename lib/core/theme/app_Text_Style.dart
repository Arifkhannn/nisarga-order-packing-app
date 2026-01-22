import 'package:flutter/material.dart';
import 'package:nisarga_order_packing/core/helper/responsive_text.dart';
import 'app_color.dart';


class AppTextStyles {
  static TextStyle heading(BuildContext context) {
    return TextStyle(
      fontSize: ResponsiveText.font(18),
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle subHeading(BuildContext context) {
    return TextStyle(
      fontSize: ResponsiveText.font(14),
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle body(BuildContext context) {
    return TextStyle(
      fontSize: ResponsiveText.font(12),
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    );
  }

  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontSize: ResponsiveText.font(12),
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    );
  }
}

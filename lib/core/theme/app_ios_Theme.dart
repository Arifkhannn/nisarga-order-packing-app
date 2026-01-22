import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';


class AppCupertinoTheme {
  static CupertinoThemeData theme = CupertinoThemeData(
    brightness: Brightness.light,

    // Brand color (buttons, switches, active states)
    primaryColor: AppColors.primary,

    // Background
    scaffoldBackgroundColor: AppColors.background,
    barBackgroundColor: AppColors.surface,

    // Text system
    textTheme: CupertinoTextThemeData(
      // Default body text
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.textPrimary,
      ),

      // Navigation bar title
      navTitleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),

      // Large title (iOS-style large headers)
      navLargeTitleTextStyle: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),

      // Action text (buttons like “View All”)
      actionTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),

      // Tab bar labels
      tabLabelTextStyle: const TextStyle(
        fontSize: 12,
        color: AppColors.textSecondary,
      ),

      // Disabled text
      pickerTextStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.textSecondary,
      ),
    ),
  );
}

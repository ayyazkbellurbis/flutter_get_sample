import 'package:flutter/material.dart';
import 'package:sample/app/theme/app_colors.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: 'Open Sans',
    colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.blueDark,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.blueDark,
        tertiary: AppColors.blueDark,
        onTertiary: AppColors.blueDark),
  );
}

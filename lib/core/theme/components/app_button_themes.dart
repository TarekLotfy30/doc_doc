import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_border_width.dart';
import '../../../constants/app_corners.dart';
import '../../../constants/app_elevation.dart';
import '../../../constants/app_sizes.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';
import '../styles/app_font_family.dart';

abstract final class AppButtonThemes {
  const AppButtonThemes._();

  static ElevatedButtonThemeData elevatedButtonTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
        elevation: AppElevation.button,
        alignment: Alignment.center,
        overlayColor: color.primary.withValues(alpha: 0.12),
        shadowColor: color.shadow,
        surfaceTintColor: color.onPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppCorners.button),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: Size(double.maxFinite, AppSizes.buttonHeightMD.h),
        textStyle: typography.headlineLarge.copyWith(
          fontSize: 16.sp,
          fontFamily: AppFontFamilyEnum.inter.name,
          height: 1.5,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: color.surface,
        foregroundColor: color.onSurface,
        elevation: AppElevation.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppCorners.button), //16
          side: BorderSide(
            color: color.primary,
            width: AppBorderWidth.defaultWidth,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        minimumSize: const Size(double.maxFinite, AppSizes.buttonHeightLG),
        // textStyle: typography.titleMedium.copyWith(
        //   fontFamily: AppFontFamilyEnum.inter.name,
        // ),
      ),
    );
  }

  static FloatingActionButtonThemeData fabTheme(IAppColors color) {
    return FloatingActionButtonThemeData(
      backgroundColor: color.primary,
      foregroundColor: color.onPrimary,
      elevation: AppElevation.button,
      shape: const CircleBorder(),
    );
  }

  static TextButtonThemeData textButtonTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: color.surface,
        foregroundColor: color.primary,
        elevation: AppElevation.button,
        alignment: Alignment.center,
        // textStyle: typography.labelSmall.copyWith(
        //   fontFamily: AppFontFamilyEnum.inter.name,
        // ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_border_width.dart';
import '../../../constants/app_corners.dart';
import '../../../constants/app_duration.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';

abstract final class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme inputDecorationTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: color.surfaceContainerHighest,

      // Default border (unfocused, enabled)
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.outline.withValues(alpha: 0.5),
          width: AppBorderWidth.defaultWidth,
        ),
      ),

      // Enabled border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.outline.withValues(alpha: 0.5),
          width: AppBorderWidth.selected,
        ),
      ),

      // Focused border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.primary,
          width: AppBorderWidth.focused,
        ),
      ),

      // Error border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(color: color.error, width: AppBorderWidth.error),
      ),

      // Focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.error,
          width: AppBorderWidth.focused.w,
        ),
      ),

      // Disabled border
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.outlineVariant,
          width: AppBorderWidth.disabled,
        ),
      ),

      // Hint styling
      // hintStyle: typography.labelMedium.copyWith(color: color.onSurfaceVariant),

      // // Helper styling
      // helperStyle: typography.labelMedium.copyWith(
      //   color: color.onSurfaceVariant,
      // ),

      // // Error styling
      // errorStyle: typography.bodyMedium.copyWith(color: color.error),

      // // Counter styling
      // counterStyle: typography.labelMedium.copyWith(
      //   color: color.onSurfaceVariant,
      // ),

      // // Label styling
      // labelStyle: typography.labelLarge.copyWith(color: color.onSurfaceVariant),

      //Content padding
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),

      // Icon colors
      prefixIconColor: color.primary,
      suffixIconColor: color.outlineVariant,
      iconColor: color.onSurfaceVariant,

      // Floating label styling
      // floatingLabelStyle: typography.labelMedium.copyWith(
      //   color: color.onSurfaceVariant,
      // ),

      // Floating label behavior
      floatingLabelBehavior: FloatingLabelBehavior.always,

      // suffixStyle: typography.labelMedium.copyWith(
      //   color: color.onSurfaceVariant,
      // ),

      // prefixStyle: typography.labelMedium.copyWith(
      //   color: color.onSurfaceVariant,
      // ),

      // Icon constraints
      prefixIconConstraints: BoxConstraints(minWidth: 24.w, minHeight: 24.h),
      suffixIconConstraints: BoxConstraints(minWidth: 24.w, minHeight: 24.h),

      activeIndicatorBorder: BorderSide(
        color: color.primary,
        width: AppBorderWidth.focused,
      ),
      errorMaxLines: 2,
      isCollapsed: false,
      hintFadeDuration: AppDurations.fast,
      focusColor: color.primary,
      hoverColor: color.primary,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      outlineBorder: const BorderSide(
        //color: color.outline.withValues(alpha: 0.5),
        width: AppBorderWidth.defaultWidth,
      ),
      hintMaxLines: 1,
    );
  }
}

// ============================================================================
// INPUT DECORATION THEME
// ============================================================================
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_border_width.dart';
import '../../constants/app_corners.dart';
import '../../constants/app_duration.dart';
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
          color: color.outline,
          width: AppBorderWidth.defaultWidth,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.outline,
          width: AppBorderWidth.defaultWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.primary,
          width: AppBorderWidth.focused,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(color: color.error, width: AppBorderWidth.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.error,
          width: AppBorderWidth.focused,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCorners.input),
        borderSide: BorderSide(
          color: color.onSurface.withValues(alpha: 0.12),
          width: AppBorderWidth.disabled,
        ),
      ),

      hintStyle: typography.bodyLarge.copyWith(color: color.onSurfaceVariant),
      helperStyle: typography.bodyLarge.copyWith(color: color.onSurfaceVariant),
      errorStyle: typography.bodyLarge.copyWith(color: color.error),
      counterStyle: typography.bodyLarge.copyWith(
        color: color.onSurfaceVariant,
      ),
      labelStyle: typography.bodyLarge.copyWith(color: color.onSurfaceVariant),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      prefixIconColor: color.onSurfaceVariant,
      suffixIconColor: color.onSurfaceVariant,
      iconColor: color.onSurfaceVariant,
      floatingLabelStyle: typography.bodyLarge.copyWith(color: color.primary),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      suffixStyle: typography.bodyLarge.copyWith(
        color: color.onSurfaceVariant,
      ),
      prefixStyle: typography.bodyLarge.copyWith(
        color: color.onSurfaceVariant,
      ),
      prefixIconConstraints: BoxConstraints(minWidth: 48.w, minHeight: 48.h),
      suffixIconConstraints: BoxConstraints(minWidth: 48.w, minHeight: 48.h),
      activeIndicatorBorder: BorderSide(
        color: color.primary,
        width: AppBorderWidth.focused,
      ),
      errorMaxLines: 2,
      isCollapsed: false,
      hintFadeDuration: AppDurations.fast,
      focusColor: color.primary.withValues(alpha: 0.12),
      hoverColor: color.onSurface.withValues(alpha: 0.08),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      visualDensity: VisualDensity.standard,
      outlineBorder: BorderSide(
        color: color.outline,
        width: AppBorderWidth.defaultWidth,
      ),
      hintMaxLines: 1,
    );
  }
}

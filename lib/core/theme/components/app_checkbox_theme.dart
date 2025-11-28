// ============================================================================
// CHECKBOX THEME
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_border_width.dart';
import '../interface/i_app_colors.dart';

abstract final class AppCheckBoxTheme {
  AppCheckBoxTheme._();

  static CheckboxThemeData checkboxTheme(IAppColors color) {
    return CheckboxThemeData(
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return color.surface;
        }
        return color.onPrimary;
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return color.onSurface.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.error)) {
            return color.error;
          }
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.88);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary.withValues(alpha: 0.92);
          }
          return color.primary;
        }
        // Unselected states
        if (states.contains(WidgetState.error)) {
          return color.error.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.pressed)) {
          return color.onSurface.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.hovered)) {
          return color.onSurface.withValues(alpha: 0.04);
        }
        return Colors.transparent;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return color.primary.withValues(alpha: 0.16);
        }
        if (states.contains(WidgetState.hovered)) {
          return color.primary.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return color.primary.withValues(alpha: 0.12);
        }
        return Colors.transparent;
      }),
      splashRadius: 24,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(
        color: color.outline.withValues(alpha: 0.5),
        width: AppBorderWidth.focused.w,
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: VisualDensity.standard,
    );
  }
}

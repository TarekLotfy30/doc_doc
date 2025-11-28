// ============================================================================
// DROPDOWN MENU THEME
// ============================================================================
import 'package:flutter/material.dart';

import '../../constants/app_border_width.dart';
import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../../constants/app_sizes.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';

abstract final class AppDropDownMenuTheme {
  const AppDropDownMenuTheme._();

  static DropdownMenuThemeData dropdownMenuTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return DropdownMenuThemeData(
      textStyle: typography.bodyLarge.copyWith(color: color.onSurface),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
          borderSide: BorderSide(
            color: color.outline,
            width: AppBorderWidth.defaultWidth,
          ),
        ),
        filled: true,
        fillColor: color.surfaceContainerHighest,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
          borderSide: BorderSide(
            color: color.outline,
            width: AppBorderWidth.defaultWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
          borderSide: BorderSide(
            color: color.primary,
            width: AppBorderWidth.focused,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
          borderSide: BorderSide(
            color: color.error,
            width: AppBorderWidth.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
          borderSide: BorderSide(
            color: color.error,
            width: AppBorderWidth.focused,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
          borderSide: BorderSide(
            color: color.onSurface.withValues(alpha: 0.12),
            width: AppBorderWidth.defaultWidth,
          ),
        ),
        errorStyle: typography.bodyLarge.copyWith(color: color.error),
        hintStyle: typography.bodyLarge.copyWith(color: color.onSurfaceVariant),
        labelStyle: typography.bodyLarge.copyWith(
          color: color.onSurfaceVariant,
        ),
        suffixStyle: typography.bodyLarge.copyWith(
          color: color.onSurfaceVariant,
        ),
        prefixStyle: typography.bodyLarge.copyWith(
          color: color.onSurfaceVariant,
        ),
        prefixIconColor: color.onSurfaceVariant,
        suffixIconColor: color.onSurfaceVariant,
        isCollapsed: false,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        constraints: BoxConstraints.tight(
          const Size.fromHeight(AppSizes.buttonHeightMD),
        ),
        floatingLabelStyle: typography.bodyLarge.copyWith(color: color.primary),
        hoverColor: color.onSurface.withValues(alpha: 0.08),
        focusColor: color.primary.withValues(alpha: 0.12),
        errorMaxLines: 2,
      ),
      menuStyle: MenuStyle(
        elevation: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return 0;
          }
          return AppElevation.dropDownMenu;
        }),
        backgroundColor: WidgetStateProperty.all(color.surfaceContainerHigh),
        surfaceTintColor: WidgetStateProperty.all(color.surfaceTint),
        shadowColor: WidgetStateProperty.all(
          color.shadow.withValues(alpha: 0.28),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8),
        ),
        alignment: AlignmentDirectional.bottomStart,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
          ),
        ),
      ),
    );
  }
}

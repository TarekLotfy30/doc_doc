import 'package:flutter/material.dart';

import '../../../constants/app_border_width.dart';
import '../../../constants/app_corners.dart';
import '../../../constants/app_elevation.dart';
import '../../../constants/app_sizes.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';

abstract final class AppDropDownMenuTheme {
  const AppDropDownMenuTheme._();

  static DropdownMenuThemeData dropdownMenuTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return DropdownMenuThemeData(
      //textStyle: typography.bodyMedium,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
          borderSide: BorderSide(
            color: color.outline.withValues(alpha: 0.5),
            width: AppBorderWidth.selected,
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
            color: color.outline.withValues(alpha: 0.5),
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
          borderSide: const BorderSide(
            //color: color.outline.withValues(alpha: 0.5),
            width: AppBorderWidth.disabled,
          ),
        ),
        // errorStyle: typography.bodyMedium.copyWith(color: color.error),
        // hintStyle: typography.bodyMedium.copyWith(color: color.outline),
        // labelStyle: typography.bodyMedium.copyWith(color: color.outline),
        // suffixStyle: typography.bodyMedium.copyWith(color: color.outline),
        // prefixStyle: typography.bodyMedium.copyWith(color: color.outline),
        prefixIconColor: color.outline,
        suffixIconColor: color.outline,
        isCollapsed: false,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        constraints: BoxConstraints.tight(
          const Size.fromHeight(AppSizes.buttonHeightMD),
        ),
        // floatingLabelStyle: typography.bodyMedium.copyWith(
        //   //color: color.outline,
        // ),
        hoverColor: color.onSurface.withValues(alpha: 0.1),
        focusColor: color.onSurface.withValues(alpha: 0.1),
        errorMaxLines: 1,
      ),
      menuStyle: MenuStyle(
        elevation: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppElevation.dropDownMenu;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppElevation.dropDownMenu;
          }
          if (states.contains(WidgetState.focused)) {
            return AppElevation.dropDownMenu;
          }
          return 0;
        }),
        shape: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
            );
          }
          if (states.contains(WidgetState.hovered)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
            );
          }
          if (states.contains(WidgetState.focused)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCorners.dropDownMenu),
            );
          }
          return null;
        }),
      ),
    );
  }
}

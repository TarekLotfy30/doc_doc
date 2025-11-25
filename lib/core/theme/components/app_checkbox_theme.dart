import 'package:flutter/material.dart';
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
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return color.primary.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.focused)) {
          return color.primary.withValues(alpha: 0.12);
        }
        return Colors.transparent;
      }),
      splashRadius: 24,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      side: const BorderSide(
        //color: color.outline.withValues(alpha: 0.5),
        //width: AppBorderWidth.focusedBorderWidth.w,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}

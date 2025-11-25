import 'package:flutter/material.dart';

import '../interface/i_app_colors.dart';

class AppSwitchTheme {
  AppSwitchTheme._();

  static SwitchThemeData switchTheme(IAppColors color) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return color.outline.withValues(alpha: 0.38);
        }
        if (states.contains(WidgetState.selected)) {
          return color.primary;
        }
        return color.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return color.outlineVariant.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.selected)) {
          return color.primary.withValues(alpha: 0.32);
        }
        return color.outlineVariant;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return color.primary.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.hovered)) {
          return color.primary.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return color.primary.withValues(alpha: 0.12);
        }
        return Colors.transparent;
      }),
    );
  }
}

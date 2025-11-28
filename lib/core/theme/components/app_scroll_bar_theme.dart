// ============================================================================
// SCROLLBAR THEME
// ============================================================================
import 'package:flutter/material.dart';

import '../interface/i_app_colors.dart';

abstract final class AppScrollBarTheme {
  const AppScrollBarTheme._();

  static ScrollbarThemeData scrollbarTheme(IAppColors color) {
    return ScrollbarThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.dragged)) {
          return color.primary.withValues(alpha: 0.9);
        }
        if (states.contains(WidgetState.hovered)) {
          return color.primary.withValues(alpha: 0.7);
        }
        return color.primary.withValues(alpha: 0.5);
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return color.surfaceContainerHighest.withValues(alpha: 0.8);
        }
        return color.surfaceContainerHighest.withValues(alpha: 0.4);
      }),
      trackBorderColor: WidgetStateProperty.all(Colors.transparent),
      thickness: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.dragged)) {
          return 12.0;
        }
        if (states.contains(WidgetState.hovered)) {
          return 10.0;
        }
        return 8.0;
      }),
      mainAxisMargin: 4,
      crossAxisMargin: 4,
      minThumbLength: 48,
      interactive: true,
      thumbVisibility: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.dragged)) {
          return true;
        }
        if (states.contains(WidgetState.hovered)) {
          return true;
        }
        return false;
      }),
      trackVisibility: WidgetStateProperty.all(false),

      radius: const Radius.circular(6),
    );
  }
}

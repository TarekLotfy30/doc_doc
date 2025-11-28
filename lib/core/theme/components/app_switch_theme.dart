// ============================================================================
// SWITCH THEME
// ============================================================================
import 'package:flutter/material.dart';

import '../interface/i_app_colors.dart';

class AppSwitchTheme {
  AppSwitchTheme._();

  static SwitchThemeData switchTheme(IAppColors color) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            return color.surface.withValues(alpha: 1);
          }
          return color.onSurface.withValues(alpha: 0.38);
        }
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.pressed)) {
            return color.primaryContainer;
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primaryContainer;
          }
          return color.onPrimary;
        }
        // Unselected states
        if (states.contains(WidgetState.pressed)) {
          return color.onSurfaceVariant;
        }
        if (states.contains(WidgetState.hovered)) {
          return color.onSurfaceVariant;
        }
        return color.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            return color.onSurface.withValues(alpha: 0.12);
          }
          return color.surfaceContainerHighest.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.88);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary.withValues(alpha: 0.92);
          }
          return color.primary;
        }
        // Unselected states
        if (states.contains(WidgetState.pressed)) {
          return color.surfaceContainerHighest.withValues(alpha: 0.88);
        }
        if (states.contains(WidgetState.hovered)) {
          return color.surfaceContainerHighest.withValues(alpha: 0.92);
        }
        return color.surfaceContainerHighest;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return color.onSurface.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        }
        return color.outline;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.16);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.focused)) {
            return color.primary.withValues(alpha: 0.12);
          }
        } else {
          if (states.contains(WidgetState.pressed)) {
            return color.onSurface.withValues(alpha: 0.12);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.onSurface.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.focused)) {
            return color.onSurface.withValues(alpha: 0.12);
          }
        }
        return Colors.transparent;
      }),
      splashRadius: 20,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      thumbIcon: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Icon(Icons.check, size: 16);
        }
        return null;
      }),
    );
  }
}

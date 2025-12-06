// ═══════════════════════════════════════════════════════════════
// NAVIGATION HELPER
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import '../extensions/navigation_extension.dart';
import 'app_logger.dart';

/// A utility class that provides static methods for handling navigation tasks
/// using named routes with comprehensive error handling and logging.
///
/// This class managing only navigation operations and provides a clean,
///  consistent interface for all navigation actions throughout the application.
// translate-me-ignore-all-file
class AppNavigation {
  // Private constructor to prevent instantiation
  const AppNavigation._();

  /// Logging tag for navigation events
  static const String _logTag = 'NAVIGATION';

  static Future<void> navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    try {
      await context.navigator.pushNamed(routeName, arguments: arguments);
    } catch (e, _) {
      rethrow;
    }
  }

  static Future<void> navigateToAndClearStack(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    try {
      await context.navigator.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    } catch (e, _) {
      rethrow;
    }
  }

  static Future<void> navigateToAndReplace(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    try {
      await context.navigator.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    } catch (e, _) {
      rethrow;
    }
  }

  static void goBack(BuildContext context, [dynamic result]) {
    if (context.navigator.canPop()) {
      context.navigator.pop(result);
    } else {
      Logger.warning('Cannot pop - no routes in stack', _logTag);
    }
  }
}

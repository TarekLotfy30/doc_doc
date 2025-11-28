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
    Logger.info('Pushing route: $routeName', _logTag);
    Logger.debug('Navigation arguments: $arguments', _logTag);
    try {
      await context.navigator.pushNamed(routeName, arguments: arguments);
      Logger.success('Route pushed successfully: $routeName', _logTag);
    } catch (e, _) {
      Logger.error('Error pushing route: $e', _logTag);
      rethrow;
    }
  }

  static Future<void> navigateToAndClearStack(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    Logger.info('Pushing $routeName and removing previous routes', _logTag);

    try {
      await context.navigator.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
      Logger.success('Route pushed and previous removed: $routeName', _logTag);
    } catch (e, _) {
      Logger.error('Error in pushAndRemove: $e', _logTag);
      rethrow;
    }
  }

  static Future<void> navigateToAndReplace(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    Logger.info('Replacing current route with: $routeName', _logTag);

    try {
      await context.navigator.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
      Logger.success('Route replaced successfully: $routeName', _logTag);
    } catch (e, _) {
      Logger.error('Error in pushReplacement: $e', _logTag);
      rethrow;
    }
  }

  static void goBack(BuildContext context, [dynamic result]) {
    if (context.navigator.canPop()) {
      Logger.info('Popping current route', _logTag);
      context.navigator.pop(result);
    } else {
      Logger.warning('Cannot pop - no routes in stack', _logTag);
    }
  }
}

import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/onboarding/presentation/screen/onboarding_screen.dart';
import '../helpers/classes/app_logger.dart';
import 'route_path.dart';

// translate-me-ignore-all-file
class AppRouter {
  static const String _logTag = 'APP_ROUTER';

  Route? generateRoute(RouteSettings settings) {
    Logger.info('🌐 Navigating to: ${settings.name}', _logTag);
    switch (settings.name) {
      case RoutePath.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case RoutePath.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return null;
    }
  }
}

// ═══════════════════════════════════════════════════════════════
// ROUTER
// ═══════════════════════════════════════════════════════════════

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/classes/app_logger.dart';
import '../../features/auth/controller/sign_in_cubit/sign_in_cubit.dart';
import '../../features/auth/controller/sign_up_cubit/sign_up_cubit.dart';
import '../../features/auth/presentation/screens/sign_in_view.dart';
import '../../features/auth/presentation/screens/sign_up_view.dart';
import '../../features/home/presentation/screens/home_view.dart';
import '../../features/onboarding/presentation/screen/onboarding_screen.dart';
import '../di/register_dependencies.dart';
import 'app_routes_name.dart';
import 'route_transitions_strategy.dart';
import 'transitions/cupertino_sheet.dart';
import 'transitions/fade_transition.dart';
import 'transitions/rotation_transition.dart';
import 'transitions/scale_transition.dart';
import 'transitions/slide_transition.dart';

// translate-me-ignore-all-file
class AppRouter {
  final _tag = 'APP_ROUTER';

  Route? generateRoute(RouteSettings settings) {
    Logger.info('🌐 Navigating to: ${settings.name}', _tag);

    switch (settings.name) {
      case AppRoutesName.onboardingView:
        return _build(child: const OnboardingView());

      case AppRoutesName.signInView:
        return _build(
          child: BlocProvider(
            create: (_) => getIt<SignInCubit>(),
            child: const SignInView(),
          ),
          forcedType: RouteType.fade,
        );

      case AppRoutesName.signUpView:
        return _build(
          child: BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpView(),
          ),
          forcedType: RouteType.fade,
        );

      case AppRoutesName.homeView:
        return _build(child: const HomeView());

      default:
        return null;
    }
  }

  // ───────────────────────────────────────────────────────────────
  // PLATFORM AWARE WRAPPER
  // ───────────────────────────────────────────────────────────────
  PageRoute<T> _build<T>({
    required Widget child,
    RouteType? forcedType,
    RouteSettings? settings,
  }) {
    final type = forcedType ?? _defaultForPlatform();

    final strategy = switch (type) {
      RouteType.fade => FadeTransitionStrategy(),
      RouteType.slide => SlideTransitionStrategy(),
      RouteType.cupertinoSheet => CupertinoSheetStrategy(),
      RouteType.scale => ScaleTransitionStrategy(),
      RouteType.rotation => RotationTransitionStrategy(),
    };

    return strategy.build(child, settings);
  }

  RouteType _defaultForPlatform() {
    if (Platform.isIOS) {
      return RouteType.cupertinoSheet;
    }
    if (Platform.isAndroid) {
      return RouteType.slide;
    }
    return RouteType.fade;
  }
}

/// Usage Examples: /// /// 1. Basic usage in generateRoute: ///
/// case AppRoutesName.profileScreen:
///   return _buildCupertinoSheetRoute(
///     const ProfileView(),
///     settings: settings,
///   );
///
/// 2. Using in widgets directly: ///

/// context.pushCupertinoSheet(const SettingsView());

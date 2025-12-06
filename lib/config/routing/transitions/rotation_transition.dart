// Rotation Transition Strategy
import 'package:flutter/material.dart';

import '../../../core/constants/app_duration.dart';
import '../../../core/helpers/classes/app_logger.dart';
import '../route_transitions_strategy.dart';

class RotationTransitionStrategy implements RouteTransitionStrategy {
  @override
  PageRoute<T> build<T>(Widget child, RouteSettings? settings) {
    Logger.info('🔴 Using Rotation Transition', 'APP_ROUTER');

    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: const Duration(seconds: 3),
      reverseTransitionDuration: const Duration(seconds: 3),
      pageBuilder: (_, animation, _) => child,
      transitionsBuilder: (_, animation, _, child) {
        final rotate = Tween(begin: 0.1, end: 0.0).animate(animation);
        return Transform.rotate(
          angle: rotate.value,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }
}

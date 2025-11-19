// Fade Transition Strategy
import 'package:flutter/material.dart';

import '../../../constants/app_animation.dart';
import '../../../constants/app_duration.dart';
import '../../helpers/classes/app_logger.dart';
import '../route_transitions_strategy.dart';

class FadeTransitionStrategy implements RouteTransitionStrategy {
  @override
  PageRoute<T> build<T>(Widget child, RouteSettings? settings) {
    Logger.info('🟣 Using Fade Transition', 'APP_ROUTER');

    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: AppDurations.standard,
      reverseTransitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, animation, _) => child,
      transitionsBuilder: (_, animation, _, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: AppAnimations.standard,
          ),
          child: child,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../helpers/classes/app_logger.dart';
import '../route_transitions_strategy.dart';

class ScaleTransitionStrategy implements RouteTransitionStrategy {
  @override
  PageRoute<T> build<T>(Widget child, RouteSettings? settings) {
    Logger.info('🟡 Using Scale Transition', 'APP_ROUTER');

    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, animation, _) => child,
      transitionsBuilder: (_, animation, _, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
            reverseCurve: Curves.easeInBack,
          ),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }
}

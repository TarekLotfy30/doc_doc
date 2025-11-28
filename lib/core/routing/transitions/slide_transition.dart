// Slide Transition Strategy
import 'package:flutter/material.dart';

import '../../constants/app_duration.dart';
import '../../helpers/classes/app_logger.dart';
import '../route_transitions_strategy.dart';

class SlideTransitionStrategy implements RouteTransitionStrategy {
  SlideTransitionStrategy({this.direction = SlideDirection.rightToLeft});
  final SlideDirection direction;

  @override
  PageRoute<T> build<T>(Widget child, RouteSettings? settings) {
    Logger.info('🔵 Using Slide Transition ($direction)', 'APP_ROUTER');

    final begin = switch (direction) {
      SlideDirection.rightToLeft => const Offset(1, 0),
      SlideDirection.leftToRight => const Offset(-1, 0),
      SlideDirection.topToBottom => const Offset(0, -1),
      SlideDirection.bottomToTop => const Offset(0, 1),
    };

    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: AppDurations.standard,
      pageBuilder: (_, animation, _) => child,
      transitionsBuilder: (_, animation, _, child) {
        final slide = Tween(begin: begin, end: Offset.zero).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
        );

        final fade = Tween(
          begin: 0.0.toInt().toDouble(),
          end: 1.0.toInt().toDouble(),
        ).animate(animation);

        return SlideTransition(
          position: slide,
          child: FadeTransition(opacity: fade, child: child),
        );
      },
    );
  }
}

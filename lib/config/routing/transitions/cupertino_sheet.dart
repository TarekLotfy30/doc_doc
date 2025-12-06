// Cupertino Sheet Strategy
import 'package:flutter/cupertino.dart';

import '../../../core/helpers/classes/app_logger.dart';
import '../route_transitions_strategy.dart';

class CupertinoSheetStrategy implements RouteTransitionStrategy {
  @override
  PageRoute<T> build<T>(Widget child, RouteSettings? settings) {
    Logger.info('🟢 Using Cupertino Sheet Transition', 'APP_ROUTER');

    return CupertinoPageRoute<T>(settings: settings, builder: (_) => child);
  }
}

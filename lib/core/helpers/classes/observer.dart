import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_logger.dart';

class MyBlocObserver extends BlocObserver {
  final _tag = 'MyBlocObserver';

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Logger.success('onCreate -- ${bloc.runtimeType}', _tag);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger.debug('onChange -- ${bloc.runtimeType}, $change', _tag);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger.error('onError -- ${bloc.runtimeType}, $error', _tag);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Logger.warning('onClose -- ${bloc.runtimeType}', _tag);
  }
}

import 'package:flutter/foundation.dart';

class Logger {
  Logger._();

  // ANSI color codes for console output
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _green = '\x1B[32m';
  static const String _gray = '\x1B[90m';
  static const String _cyan = '\x1B[36m';

  // Icons
  static const String _iconLog = '📝';
  static const String _iconError = '❌';
  static const String _iconWarning = '⚠️';
  static const String _iconInfo = 'ℹ️';
  static const String _iconSuccess = '✅';
  static const String _iconDebug = '🐞';

  static void _print(
    String icon,
    String level,
    String color, {
    required String message,
    required String name,
  }) {
    if (kDebugMode) {
      print(
        '$color[$level]$_reset $_gray-$_reset [$_cyan$name$_reset] $icon $_cyan$message$_reset',
      );
    }
  }

  static void log(String message, String name) {
    _print(_iconLog, 'LOG', _gray, message: message, name: name);
  }

  static void error(
    String message,
    String name, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    _print(_iconError, 'ERROR', _red, message: message, name: name);
    if (error != null) {
      debugPrint('$_red  Error details: $error$_reset');
    }
    if (stackTrace != null) {
      debugPrint('$_gray  Stack trace: $stackTrace$_reset');
    }
  }

  static void warning(String message, String name) {
    _print(_iconWarning, 'WARN', _yellow, message: message, name: name);
  }

  static void info(String message, String name) {
    _print(_iconInfo, 'INFO', _blue, message: message, name: name);
  }

  static void success(String message, String name) {
    _print(_iconSuccess, 'SUCCESS', _green, message: message, name: name);
  }

  static void debug(String message, String name) {
    _print(_iconDebug, 'DEBUG', _gray, message: message, name: name);
  }
}

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

  static void _print(
    String level,
    String color, {
    required String message,
    required String name,
  }) {
    if (kDebugMode) {
      print('$color[$level]$_reset $_gray$_reset - [$name] $message');
    }
  }

  static void log(String message, String name) {
    _print('LOG', _gray, message: message, name: '');
  }

  static void error(
    String message,
    String name, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    _print('ERROR', _red, message: message, name: name);
  }

  static void warning(String message, String name) {
    _print('WARN', _yellow, message: message, name: name);
  }

  static void info(String message, String name) {
    _print('INFO', _blue, message: message, name: name);
  }

  static void success(String message, String name) {
    _print('SUCCESS', _green, message: message, name: name);
  }

  static void debug(String message, String name) {
    _print('DEBUG', _gray, message: message, name: name);
  }
}

// Logger.info('App started');
// Logger.success('Data loaded successfully');
// Logger.warning('Cache is getting full');
// Logger.error('Failed to fetch data', exception, stackTrace);
// Logger.debug('User tapped button at position (120, 340)');

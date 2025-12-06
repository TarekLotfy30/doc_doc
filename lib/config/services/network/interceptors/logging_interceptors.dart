// ═══════════════════════════════════════════════════════════════
// LOGGING INTERCEPTOR
// ═══════════════════════════════════════════════════════════════

// ignore_for_file: lines_longer_than_80_chars, avoid_catches_without_on_clauses

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/helpers/classes/app_logger.dart';

/// Interceptor for detailed logging of HTTP requests and responses
/// Only active in debug mode to avoid performance impact in production
/// Styled similar to pretty_dio_logger package
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    this.logRequestBody = true,
    this.logResponseBody = true,
    this.logHeaders = true,
    this.maxLogLength = 2000,
    this.requestLevel = Level.info,
    this.responseLevel = Level.success,
    this.errorLevel = Level.error,
  });

  static const String _tag = 'HTTP';

  /// Enable/disable request body logging
  final bool logRequestBody;

  /// Enable/disable response body logging
  final bool logResponseBody;

  /// Enable/disable request headers logging
  final bool logHeaders;

  /// Maximum length for logged data (to prevent huge logs)
  final int maxLogLength;

  /// Log level for requests
  final Level requestLevel;

  /// Log level for responses
  final Level responseLevel;

  /// Log level for errors
  final Level errorLevel;

  // Box drawing characters
  static const String topLeftCorner = '┌';
  static const String bottomLeftCorner = '└';
  static const String middleCorner = '├';
  static const String horizontalLine = '─';
  static const String verticalLine = '│';
  static const String doubleDivider = '┄';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Only log in debug mode
    if (!kDebugMode) {
      return handler.next(options);
    }

    _logRequest(options);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kDebugMode) {
      return handler.next(response);
    }

    _logResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!kDebugMode) {
      return handler.next(err);
    }

    _logError(err);
    handler.next(err);
  }

  void _logRequest(RequestOptions options) {
    _log(requestLevel, '$topLeftCorner${horizontalLine * 50}');
    _log(requestLevel, '$verticalLine 🚀 REQUEST ║ ${options.method}');
    _log(requestLevel, '$middleCorner${horizontalLine * 50}');

    // URL
    _log(requestLevel, '$verticalLine URL: ${options.uri}');

    // Method
    _log(requestLevel, '$verticalLine Method: ${options.method}');

    // Headers
    if (logHeaders && options.headers.isNotEmpty) {
      _log(requestLevel, '$middleCorner Headers:');
      options.headers.forEach((key, value) {
        final maskedValue = _maskSensitiveData(key, value.toString());
        final wrappedLines = _wrapLongLine('$key: $maskedValue');
        for (final line in wrappedLines.split('\n')) {
          _log(requestLevel, '$verticalLine  $line');
        }
      });
    }

    // Query Parameters
    if (options.queryParameters.isNotEmpty) {
      _log(requestLevel, '$middleCorner Query Parameters:');
      options.queryParameters.forEach((key, value) {
        final wrappedLines = _wrapLongLine('$key: $value');
        for (final line in wrappedLines.split('\n')) {
          _log(requestLevel, '$verticalLine  $line');
        }
      });
    }

    // Request Body
    if (logRequestBody && options.data != null) {
      _log(requestLevel, '$middleCorner Body:');
      final prettyBody = _prettyPrintJson(options.data);
      for (final line in prettyBody.split('\n')) {
        final wrappedLines = _wrapLongLine(line);
        for (final wrappedLine in wrappedLines.split('\n')) {
          _log(requestLevel, '$verticalLine  $wrappedLine');
        }
      }
    }

    _log(requestLevel, '$bottomLeftCorner${horizontalLine * 50}');
  }

  /// Log response details
  void _logResponse(Response response) {
    final statusCode = response.statusCode ?? 0;
    final isSuccess = statusCode >= 200 && statusCode < 300;
    final level = isSuccess ? responseLevel : errorLevel;
    final emoji = isSuccess ? '✅' : '⚠️';

    _log(level, '$topLeftCorner${horizontalLine * 50}');
    _log(
      level,
      '$verticalLine $emoji RESPONSE ║ ${response.requestOptions.method} ║ Status: $statusCode',
    );
    _log(level, '$middleCorner${horizontalLine * 50}');

    // URL
    _log(level, '$verticalLine URL: ${response.requestOptions.uri}');

    // Status Code
    _log(
      level,
      '$verticalLine Status Code: $statusCode ${_getStatusMessage(statusCode)}',
    );

    // Duration (if available)
    final duration = _calculateDuration(response);
    if (duration != null) {
      _log(level, '$verticalLine Duration: ${duration}ms');
    }

    // Response Headers
    if (logHeaders && response.headers.map.isNotEmpty) {
      _log(level, '$middleCorner Response Headers:');
      response.headers.map.forEach((key, value) {
        _log(level, '$verticalLine  $key: ${value.join(', ')}');
      });
    }

    // Response Body
    if (logResponseBody && response.data != null) {
      _log(level, '$middleCorner Response Data:');
      final prettyBody = _prettyPrintJson(response.data);
      final lines = prettyBody.split('\n');

      // Limit number of lines if too long
      if (lines.length > 100) {
        for (var i = 0; i < 50; i++) {
          _log(level, '$verticalLine  ${_wrapLongLine(lines[i])}');
        }
        _log(level, '$verticalLine  ... (${lines.length - 50} more lines)');
      } else {
        for (final line in lines) {
          // Wrap long lines to keep them inside the box
          final wrappedLines = _wrapLongLine(line);
          for (final wrappedLine in wrappedLines.split('\n')) {
            _log(level, '$verticalLine  $wrappedLine');
          }
        }
      }
    }

    _log(level, '$bottomLeftCorner${horizontalLine * 50}');
  }

  /// Log error details
  void _logError(DioException error) {
    _log(errorLevel, '$topLeftCorner${horizontalLine * 50}');
    _log(errorLevel, '$verticalLine ❌ ERROR ║ ${error.requestOptions.method}');
    _log(errorLevel, '$middleCorner${horizontalLine * 50}');

    // Error Type
    _log(errorLevel, '$verticalLine Error Type: ${error.type.name}');

    // URL
    _log(errorLevel, '$verticalLine URL: ${error.requestOptions.uri}');

    // Method
    _log(errorLevel, '$verticalLine Method: ${error.requestOptions.method}');

    // Error Message
    if (error.message != null) {
      final wrappedLines = _wrapLongLine('Message: ${error.message}');
      for (final line in wrappedLines.split('\n')) {
        _log(errorLevel, '$verticalLine $line');
      }
    }

    // Response Data (if available)
    if (error.response != null) {
      final response = error.response!;
      _log(errorLevel, '$verticalLine Status Code: ${response.statusCode}');

      if (response.data != null) {
        _log(errorLevel, '$middleCorner Error Response:');
        final prettyBody = _prettyPrintJson(response.data);
        for (final line in prettyBody.split('\n')) {
          final wrappedLines = _wrapLongLine(line);
          for (final wrappedLine in wrappedLines.split('\n')) {
            _log(errorLevel, '$verticalLine  $wrappedLine');
          }
        }
      }
    }

    // Stack Trace (shortened)
      _log(errorLevel, '$middleCorner Stack Trace (first 5 lines):');
      final stackLines = error.stackTrace.toString().split('\n').take(5);
      for (final line in stackLines) {
        if (line.trim().isNotEmpty) {
          final wrappedLines = _wrapLongLine(line);
          for (final wrappedLine in wrappedLines.split('\n')) {
            _log(errorLevel, '$verticalLine  $wrappedLine');
          }
        }
      }
    

    _log(errorLevel, '$bottomLeftCorner${horizontalLine * 50}');
  }

  /// Pretty print JSON data
  String _prettyPrintJson(dynamic data) {
    try {
      // If it's already a string, try to parse it
      if (data is String) {
        try {
          final decoded = json.decode(data);
          return const JsonEncoder.withIndent('  ').convert(decoded);
        } catch (_) {
          return data;
        }
      }

      // If it's a map or list, encode it with indentation
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }

      // Otherwise, just convert to string
      return data.toString();
    } catch (e) {
      return data.toString();
    }
  }

  /// Calculate request duration
  int? _calculateDuration(Response response) {
    try {
      final requestTime =
          response.requestOptions.extra['request_time'] as DateTime?;
      if (requestTime != null) {
        return DateTime.now().difference(requestTime).inMilliseconds;
      }
    } catch (_) {}
    return null;
  }

  /// Get human-readable status message
  String _getStatusMessage(int statusCode) {
    switch (statusCode) {
      case 200:
        return '(OK)';
      case 201:
        return '(Created)';
      case 204:
        return '(No Content)';
      case 400:
        return '(Bad Request)';
      case 401:
        return '(Unauthorized)';
      case 403:
        return '(Forbidden)';
      case 404:
        return '(Not Found)';
      case 500:
        return '(Internal Server Error)';
      case 502:
        return '(Bad Gateway)';
      case 503:
        return '(Service Unavailable)';
      default:
        return '';
    }
  }

  /// Mask sensitive data in headers (tokens, passwords, etc.)
  String _maskSensitiveData(String key, String value) {
    final sensitiveKeys = [
      'authorization',
      'auth',
      'token',
      'password',
      'secret',
      'api-key',
      'apikey',
      'bearer',
    ];

    if (sensitiveKeys.any((k) => key.toLowerCase().contains(k))) {
      if (value.length <= 10) {
        return '***';
      }
      // Show first 4 and last 4 characters
      return '${value.substring(0, 4)}...${value.substring(value.length - 4)}';
    }

    return value;
  }

  /// Helper method to log with appropriate level
  void _log(Level level, String message) {
    switch (level) {
      case Level.debug:
        Logger.info(message, _tag);
      case Level.info:
        Logger.info(message, _tag);
      case Level.success:
        Logger.info(message, _tag);
      case Level.warning:
        Logger.info(message, _tag);
      case Level.error:
        Logger.error(message, _tag);
    }
  }

  /// Wrap long lines to fit within console width
  /// Prevents text from breaking out of the box borders
  String _wrapLongLine(String text, {int maxWidth = 120}) {
    if (text.length <= maxWidth) {
      return text;
    }

    final buffer = StringBuffer();
    var currentIndex = 0;

    while (currentIndex < text.length) {
      final endIndex = (currentIndex + maxWidth < text.length)
          ? currentIndex + maxWidth
          : text.length;

      if (currentIndex > 0) {
        buffer.write('\n');
      }

      buffer.write(text.substring(currentIndex, endIndex));
      currentIndex = endIndex;
    }

    return buffer.toString();
  }
}

/// Log levels for different types of messages
enum Level { debug, info, success, warning, error }

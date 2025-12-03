// ═══════════════════════════════════════════════════════════════
// LOGGING INTERCEPTOR
// Path: lib/core/network/api_consumer/interceptors/logging_interceptor.dart
// ═══════════════════════════════════════════════════════════════

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/helpers/classes/app_logger.dart';

/// Interceptor for detailed logging of HTTP requests and responses
/// Only active in debug mode to avoid performance impact in production
// translate-me-ignore-all-file
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    this.logRequestBody = true,
    this.logResponseBody = true,
    this.logHeaders = true,
    this.maxLogLength = 1000,
  });
  static const String _tag = 'HTTP_LOGGER';

  /// Enable/disable request body logging
  final bool logRequestBody;

  /// Enable/disable response body logging
  final bool logResponseBody;

  /// Enable/disable request headers logging
  final bool logHeaders;

  /// Maximum length for logged data (to prevent huge logs)
  final int maxLogLength;

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

  /// Log request details
  void _logRequest(RequestOptions options) {
    Logger.info('╔═══════════════════════════════════════', _tag);
    Logger.info('║ 🚀 REQUEST', _tag);
    Logger.info('╠═══════════════════════════════════════', _tag);
    Logger.info('║ Method: ${options.method}', _tag);
    Logger.info('║ URL: ${options.uri}', _tag);

    if (logHeaders && options.headers.isNotEmpty) {
      Logger.debug('║ Headers:', _tag);
      options.headers.forEach((key, value) {
        // Mask sensitive headers
        final maskedValue = _maskSensitiveData(key, value.toString());
        Logger.debug('║   $key: $maskedValue', _tag);
      });
    }

    if (options.queryParameters.isNotEmpty) {
      Logger.debug('║ Query Parameters:', _tag);
      options.queryParameters.forEach((key, value) {
        Logger.debug('║   $key: $value', _tag);
      });
    }

    if (logRequestBody && options.data != null) {
      Logger.debug('║ Body:', _tag);
      final body = _truncateLog(options.data.toString());
      Logger.debug('║   $body', _tag);
    }

    Logger.info('╚═══════════════════════════════════════', _tag);
  }

  /// Log response details
  void _logResponse(Response response) {
    final statusCode = response.statusCode;
    final isSuccess =
        statusCode != null && statusCode >= 200 && statusCode < 300;

    Logger.info('╔═══════════════════════════════════════', _tag);
    Logger.info('║ ✅ RESPONSE (${isSuccess ? 'SUCCESS' : 'ERROR'})', _tag);
    Logger.info('╠═══════════════════════════════════════', _tag);
    Logger.info('║ Status Code: $statusCode', _tag);
    Logger.info('║ URL: ${response.requestOptions.uri}', _tag);
    Logger.info('║ Method: ${response.requestOptions.method}', _tag);

    if (logResponseBody && response.data != null) {
      Logger.debug('║ Response Data:', _tag);
      final data = _truncateLog(response.data.toString());
      Logger.debug('║   $data', _tag);
    }

    Logger.info('╚═══════════════════════════════════════', _tag);
  }

  /// Log error details
  void _logError(DioException error) {
    Logger.error('╔═══════════════════════════════════════', _tag);
    Logger.error('║ ❌ ERROR', _tag);
    Logger.error('╠═══════════════════════════════════════', _tag);
    Logger.error('║ Type: ${error.type}', _tag);
    Logger.error('║ Message: ${error.message}', _tag);
    Logger.error('║ URL: ${error.requestOptions.uri}', _tag);
    Logger.error('║ Method: ${error.requestOptions.method}', _tag);

    if (error.response != null) {
      Logger.error('║ Status Code: ${error.response!.statusCode}', _tag);

      if (error.response!.data != null) {
        final errorData = _truncateLog(error.response!.data.toString());
        Logger.error('║ Error Data: $errorData', _tag);
      }
    }

    Logger.error('║ Stack Trace:', _tag);
    final stackTrace = _truncateLog(error.stackTrace.toString());
    Logger.error('║   $stackTrace', _tag);

    Logger.error('╚═══════════════════════════════════════', _tag);
  }

  /// Truncate log message if it exceeds maximum length
  String _truncateLog(String message) {
    if (message.length <= maxLogLength) {
      return message;
    }
    return '${message.substring(0, maxLogLength)}... (truncated)';
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
}

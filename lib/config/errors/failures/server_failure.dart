// ═══════════════════════════════════════════════════════════════
// SERVER FAILURE (DIO/API ERRORS)
// ═══════════════════════════════════════════════════════════════
import 'package:dio/dio.dart';

import '../../../core/helpers/classes/app_logger.dart';
import '../error_messages/api_error_messages.dart';
import 'failure.dart';

abstract final class StatusCode {
  static const int ok = 200;
  static const int created = 201;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int internalServerError = 500;
  static const int serviceUnavailable = 503;
  static const int connectionTimeout = -1;
  static const int receiveTimeout = -2;
  static const int sendTimeout = -3;
}

/// Represents failures that occur during server communication
///
/// This class handles errors from the Dio HTTP client and provides
/// comprehensive error mapping and response parsing capabilities.
// translate-me-ignore-all-file
class ServerFailure extends Failure {
  ServerFailure(super.errorMessage, super.errorCode);

  /// Factory constructor to create a ServerFailure from a DioException
  factory ServerFailure.fromDioError(DioException dioError) {
    // Log the original error for debugging
    Logger.warning(
      'Dio error occurred: ${dioError.type} - ${dioError.message}',
      _tag,
    );

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          ApiErrorMessages.connectionTimeout,
          dioError.response?.statusCode ?? StatusCode.connectionTimeout,
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          ApiErrorMessages.sendTimeout,
          dioError.response?.statusCode ?? StatusCode.sendTimeout,
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          ApiErrorMessages.receiveTimeout,
          dioError.response?.statusCode ?? StatusCode.receiveTimeout,
        );

      case DioExceptionType.cancel:
        return ServerFailure(
          ApiErrorMessages.requestCancelled,
          dioError.response?.statusCode ?? StatusCode.connectionTimeout,
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          ApiErrorMessages.badCertificate,
          dioError.response?.statusCode ?? StatusCode.connectionTimeout,
        );

      case DioExceptionType.badResponse:
        if (dioError.response != null) {
          return ServerFailure.fromResponse(
            dioError.response!.statusCode,
            dioError.response!.data,
          );
        }
        return ServerFailure(
          ApiErrorMessages.nullResponse,
          dioError.response?.statusCode ?? StatusCode.connectionTimeout,
        );

      case DioExceptionType.connectionError:
        // Check for specific connection issues
        final errorMessage = dioError.message?.toLowerCase() ?? '';
        if (_isNetworkConnectionError(errorMessage)) {
          return ServerFailure(
            ApiErrorMessages.noInternet,
            dioError.response?.statusCode ?? StatusCode.connectionTimeout,
          );
        }
        return ServerFailure(
          ApiErrorMessages.connectionError,
          dioError.response?.statusCode ?? StatusCode.connectionTimeout,
        );

      case DioExceptionType.unknown:
        // More specific unknown error handling
        final errorMessage = dioError.message?.toLowerCase() ?? '';
        if (_isNetworkConnectionError(errorMessage)) {
          return ServerFailure(
            ApiErrorMessages.noInternet,
            dioError.response?.statusCode ?? StatusCode.connectionTimeout,
          );
        }
        return ServerFailure(
          ApiErrorMessages.unexpectedError,
          dioError.response?.statusCode ?? StatusCode.connectionTimeout,
        );
    }
  }

  /// Response parsing with better error extraction
  factory ServerFailure.fromResponse(int? statusCode, dynamic responseData) {
    // Log response details for debugging
    Logger.warning(
      'Server response error: Status $statusCode, Data: $responseData',
      _tag,
    );

    final fallbackMessage = statusCode != null
        ? ApiErrorMessages.getHttpStatusMessage(statusCode)
        : ApiErrorMessages.genericError;

    // Extract error message from response data with multiple fallback options
    String? errorMessage;

    if (responseData is Map<String, dynamic>) {
      // Try to extract error from common response fields
      errorMessage =
          responseData['error'] as String? ??
          responseData['message'] as String? ??
          responseData['detail'] as String? ??
          fallbackMessage;
    } else {
      // If response is not a map, use fallback message
      errorMessage = fallbackMessage;
    }

    return ServerFailure(
      errorMessage,
      statusCode ?? StatusCode.connectionTimeout,
    );
  }

  /// Helper method to determine if an error message indicates
  /// a network connection issue
  static bool _isNetworkConnectionError(String errorMessage) {
    const networkErrorPatterns = [
      'socketexception',
      'network is unreachable',
      'no address associated with hostname',
      'network unavailable',
      'host unreachable',
      'connection refused',
      'timeout',
    ];

    return networkErrorPatterns.any(
      (pattern) => errorMessage.contains(pattern),
    );
  }

  static const String _tag = 'SERVER_FAILURE';
}

// ═══════════════════════════════════════════════════════════════
// DIO CONSUMER CLASS
// ═══════════════════════════════════════════════════════════════

// ignore_for_file: lines_longer_than_80_chars

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/app_duration.dart';
import '../../../core/helpers/classes/app_logger.dart';
import '../../connection/connectivity_interceptor.dart';
import '../../di/register_dependencies.dart';
import 'api_config.dart';
import 'i_api_consumer.dart';
import 'interceptors/logging_interceptors.dart';

/// Dio-based HTTP client implementation with comprehensive request handling
// translate-me-ignore-all-file
class DioConsumer implements IApiConsumer {
  /// Constructor initializes the Dio client with proper configuration
  DioConsumer() {
    _initializeDioClient();
    _attachInterceptors();
    Logger.info(
      'DioConsumer initialized successfully with base URL:${ApiConfig.baseUrl}',
      _tag,
    );
  }

  /// Internal Dio client instance
  late final Dio _dioClient;

  /// Unique identifier for logging purposes
  final String _tag = 'DioConsumer';

  /// Maximum retry attempts for failed requests
  static const int _maxRetryAttempts = 3;

  /// Initializes the Dio client with base options and configurations
  void _initializeDioClient() {
    _dioClient = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: AppDurations.apiConnectTimeout,
        sendTimeout: AppDurations.apiTimeout,
        receiveTimeout: AppDurations.apiTimeout,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true,
        headers: _getDefaultHeaders(),
        validateStatus: _validateResponseStatus,
        followRedirects: true,
        maxRedirects: 5,
        persistentConnection: true,
        listFormat: ListFormat.multi,
      ),
    );
  }

  /// Returns default headers for all API requests
  Map<String, String> _getDefaultHeaders() {
    return {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'User-Agent': 'FlutterApp/1.0',
    };
  }

  /// Validates HTTP response status codes
  bool _validateResponseStatus(int? status) {
    if (status == null) {
      Logger.error('Response status is null', _tag);
      return false;
    }
    return status < 500; // Accept all non-server error responses
  }

  /// Attaches all required interceptors to the Dio client
  void _attachInterceptors() {
    // 1. Connectivity Check (First - block if no internet)
    _dioClient.interceptors.add(getIt<ConnectivityInterceptor>());

    // 2. Language Headers (Add language before auth)
    //_dioClient.interceptors.add(getIt<LanguageInterceptor>());

    // 3. Authentication (Add auth token)
    //_dioClient.interceptors.add(getIt<AuthInterceptor>());

    // 4. Logging (Log after all headers are set, only in debug mode)
    if (kDebugMode) {
      _dioClient.interceptors.add(
        LoggingInterceptor(
          logRequestBody: true,
          logResponseBody: true,
          logHeaders: true,
          maxLogLength: 2000,
        ),
      );
    }
    //OR
    /*    
    if (kDebugMode) {
      _dioClient.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    } 
    */

    // 5. Retry Logic (Retry failed requests)
    _dioClient.interceptors.add(
      RetryInterceptor(
        dio: _dioClient,
        retries: _maxRetryAttempts,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
        retryEvaluator: _shouldRetryRequest,
      ),
    );

    Logger.info('All interceptors attached successfully', _tag);
  }

  /// Determines if a request should be retried based on error type
  bool _shouldRetryRequest(DioException error, int attempt) {
    final errorType = error.type;
    final statusCode = error.response?.statusCode;

    // Log retry attempt
    Logger.warning(
      'Request failed (attempt $attempt) with type: $errorType, status: $statusCode. \n Considering for retry...',
      _tag,
    );

    // Don't retry client errors (4xx) except 408, 429
    if (statusCode != null && statusCode >= 400 && statusCode < 500) {
      return statusCode == 408 || statusCode == 429;
    }

    // Retry on network errors and server errors
    return errorType == DioExceptionType.connectionTimeout ||
        errorType == DioExceptionType.connectionError ||
        errorType == DioExceptionType.sendTimeout ||
        errorType == DioExceptionType.receiveTimeout ||
        (statusCode != null && statusCode >= 500);
  }

  @override
  Future<Response<Map<String, dynamic>>> get({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    bool overrideDefaultHeaders = false,
  }) async {
    try {
      final effectiveHeaders = _mergeHeaders(headers, overrideDefaultHeaders);
      final response = await _dioClient.get<Map<String, dynamic>>(
        endPoint,
        queryParameters: params,
        options: Options(headers: effectiveHeaders),
      );
      return response;
    } catch (e) {

      rethrow;
    }
  }

  @override
  Future<Response<Map<String, dynamic>>> post({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool overrideDefaultHeaders = false,
  }) async {
    try {
      final effectiveHeaders = _mergeHeaders(headers, overrideDefaultHeaders);
      final response = await _dioClient.post<Map<String, dynamic>>(
        endPoint,
        data: body,
        queryParameters: params,
        options: Options(headers: effectiveHeaders),
      );
      return response;
    } catch (error) {
      Logger.error('POST request failed: $error', _tag);
      rethrow;
    }
  }

  @override
  @override
  Future<Response<Map<String, dynamic>>> put({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool overrideDefaultHeaders = false,
  }) async {
    try {
      final effectiveHeaders = _mergeHeaders(headers, overrideDefaultHeaders);
      final response = await _dioClient.put<Map<String, dynamic>>(
        endPoint,
        data: body,
        queryParameters: params,
        options: Options(headers: effectiveHeaders),
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Response<Map<String, dynamic>>> delete({
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool overrideDefaultHeaders = false,
  }) async {
    try {
      final effectiveHeaders = _mergeHeaders(headers, overrideDefaultHeaders);
      final response = await _dioClient.delete<Map<String, dynamic>>(
        endPoint,
        data: body,
        queryParameters: params,
        options: Options(headers: effectiveHeaders),
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  /// Merges custom headers with default headers based on override flag
  Map<String, dynamic>? _mergeHeaders(
    Map<String, dynamic>? customHeaders,
    bool overrideDefaultHeaders,
  ) {
    final mergedHeaders = {
      ..._dioClient.options.headers,
      if (customHeaders != null) ...customHeaders,
    };

    return overrideDefaultHeaders
        ? customHeaders // Only use these headers for this request
        : mergedHeaders; // merge with defaults
  }
}

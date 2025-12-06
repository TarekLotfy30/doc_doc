// ═══════════════════════════════════════════════════════════════
// CONNECTIVITY INTERCEPTOR SERVICE
// ═══════════════════════════════════════════════════════════════

import 'package:dio/dio.dart';

import '../../core/helpers/classes/app_logger.dart';
import '../errors/error_messages/api_error_messages.dart';
import 'connectivity_service.dart';

/// Interceptor that validates network connectivity before making API requests
/// Ensures that requests are only made when the device has active
/// internet connection.

// translate-me-ignore-all-file
class ConnectivityInterceptor extends Interceptor {
  /// Constructor that requires a connectivity service instance
  ConnectivityInterceptor(this._connectivityService);

  /// Service instance for connectivity validation
  final ConnectivityService _connectivityService;

  /// Logger tag for this interceptor
  final String _tag = 'CONNECTIVITY_INTERCEPTOR';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    Logger.debug(
      'Checking connectivity for: ${options.method} ${options.path}',
      _tag,
    );

    try {
      // Check if device has internet connection
      final hasInternet = await _connectivityService.hasInternetConnection();

      if (!hasInternet) {
        Logger.error(ApiErrorMessages.noInternet, _tag);

        // Reject the request with a connection error
        handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.connectionError,
            message: ApiErrorMessages.noInternet,
          ),
        );
        return;
      }

      Logger.debug(
        'Internet connection verified, proceeding with request',
        _tag,
      );
    } catch (error) {
      Logger.error('Error checking connectivity: $error', _tag);
      // If connectivity check fails, reject the request
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          message: 'Failed to verify internet connection: $error',
        ),
      );
      rethrow;
    }

    // Proceed with the request if connectivity is available
    handler.next(options);
  }
}



// Future<void> makeApiCall() async {
//   try {
   // Your API call
//     await dio.get('/endpoint');
//   } on DioException catch (e) {
//     if (e.error is NoInternetConnectionException) {
    // Show no internet dialog/snackbar
//       print('Please check your internet connection');
//     } else {
    // Handle other errors
//       print('API error: ${e.message}');
//     }
//   }

// dio.interceptors.add(
//     ConnectivityInterceptor(getIt<ConnectivityService>()),
//   );

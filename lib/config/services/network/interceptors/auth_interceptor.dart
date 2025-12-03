// // ═══════════════════════════════════════════════════════════════
// // AUTH INTERCEPTOR
// // ═══════════════════════════════════════════════════════════════

// import 'package:dio/dio.dart';

// import '../../../../core/helpers/classes/app_logger.dart';
// import '../../secure_storage/secure_storage_service.dart';

// /// Interceptor that adds authentication token to request headers
// /// Automatically injects Bearer token for authenticated requests
// // translate-me-ignore-all-file
// class AuthInterceptor extends Interceptor {
//   AuthInterceptor(this._secureStorage);

//   final SecureStorageService _secureStorage;
//   static const String _tag = 'AUTH_INTERCEPTOR';
//   static const String _authHeaderPrefix = 'Bearer ';
//   static const String _authHeaderKey = 'Authorization';

//   @override
//   Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     try {
//       // Skip auth for endpoints that don't need it
//       if (_shouldSkipAuth(options)) {
//         Logger.debug('Skipping auth for: ${options.path}', _tag);
//         return handler.next(options);
//       }

//       // Get token from secure storage
//       final token = await _secureStorage.getToken();

//       if (token != null && token.isNotEmpty) {
//         options.headers[_authHeaderKey] = '$_authHeaderPrefix$token';
//         Logger.debug('Auth token added to request', _tag);
//       } else {
//         Logger.warning('No auth token available', _tag);
//       }

//       handler.next(options);
//     } catch (error) {
//       Logger.error('Error adding auth token: $error', _tag);
//       handler.next(options);
//       rethrow;
//     }
//   }

//   /// Check if the endpoint should skip authentication
//   bool _shouldSkipAuth(RequestOptions options) {
//     // Add your public endpoints here
//     final publicEndpoints = [
//       '/auth/login',
//       '/auth/register',
//       '/auth/forgot-password',
//       '/auth/refresh-token',
//     ];

//     return publicEndpoints.any((endpoint) => options.path.contains(endpoint));
//   }

//   @override
//   Future<void> onError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     // Handle 401 Unauthorized - token expired or invalid
//     if (err.response?.statusCode == 401) {
//       Logger.warning('Unauthorized request - token may be expired', _tag);

//       try {
//         // Try to refresh token
//         final refreshed = await _attemptTokenRefresh(err.requestOptions);

//         if (refreshed) {
//           // Retry the request with new token
//           handler.resolve(await _retryRequest(err.requestOptions));
//           return;
//         }
//       } catch (e) {
//         Logger.error('Token refresh failed: $e', _tag);
//         rethrow;
//       }

//       // Clear token and let app handle logout
//       await _secureStorage.clearToken();
//       Logger.info('Token cleared due to authentication failure', _tag);
//     }

//     handler.next(err);
//   }

//   /// Attempt to refresh the authentication token
//   Future<bool> _attemptTokenRefresh(RequestOptions options) async {
//     try {
//       final refreshToken = await _secureStorage.getRefreshToken();

//       if (refreshToken == null) {
//         return false;
//       }

//       // TODO: Implement your token refresh logic here
//       // final response = await _dio.post('/auth/refresh', data: {...});
//       // await _secureStorage.saveToken(response.data['token']);

//       Logger.info('Token refreshed successfully', _tag);
//       return true;
//     } catch (e) {
//       Logger.error('Token refresh error: $e', _tag);
//       rethrow;
//     }
//   }

//   /// Retry the failed request with updated token
//   Future<Response<dynamic>> _retryRequest(RequestOptions options) async {
//     final dio = Dio();

//     // Get the new token
//     final newToken = await _secureStorage.getToken();

//     if (newToken != null) {
//       options.headers[_authHeaderKey] = '$_authHeaderPrefix$newToken';
//     }

//     return dio.request(
//       options.path,
//       data: options.data,
//       queryParameters: options.queryParameters,
//       options: Options(method: options.method, headers: options.headers),
//     );
//   }
// }

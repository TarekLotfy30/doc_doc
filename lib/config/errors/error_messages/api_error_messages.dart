// ═══════════════════════════════════════════════════════════════
// API ERROR MESSAGES
// ═══════════════════════════════════════════════════════════════

/// Centralized repository for all API error messages and HTTP status codes
///
/// This class containing only error message constants and provides
/// a clean interface for retrieving user-friendly error messages.
abstract final class ApiErrorMessages {
  const ApiErrorMessages._();

  // ========================= Network Errors ========================
  static const String connectionTimeout =
      'Connection timeout. Please check your internet connection.';
  static const String sendTimeout =
      'Request timeout. The server is taking too long to respond.';
  static const String receiveTimeout = 'Response timeout. Please try again.';
  static const String requestCancelled = 'Request was cancelled.';
  static const String badCertificate =
      'Security certificate error. Please contact support.';
  static const String connectionError =
      'Unable to connect to server. Please check your connection.';
  static const String noInternet =
      'No internet connection. Please check your network settings.';
  static const String unexpectedError =
      'Something went wrong. Please try again.';
  static const String genericError =
      'An error occurred. Please try again later.';
  static const String nullResponse =
      'Invalid server response. Please try again.';
  static const String unknownError =
      'Unknown error occurred. Please contact support.';

  // ========================= HTTP Status Codes ========================
  /// Mapping of HTTP status codes to user-friendly error messages
  static const Map<int, String> httpStatusMessages = {
    // Client errors (4xx)
    400: 'Invalid request. Please check your input.',
    401: 'Authentication required. Please log in again.',
    402: 'Payment required to access this resource.',
    403: "Access denied. You don't have permission.",
    404: 'The requested resource was not found.',
    405: 'Method not allowed.',
    406: 'Request format not acceptable.',
    408: 'Request timeout. Please try again.',
    409: 'Conflict with current resource state.',
    410: 'Resource is no longer available.',
    422: 'Invalid data provided. Please check your input.',
    429: 'Too many requests. Please wait and try again.',

    // Server errors (5xx)
    500: 'Internal server error. Please try again later.',
    501: 'Feature not implemented.',
    502: 'Server temporarily unavailable.',
    503: 'Service temporarily unavailable. Please try again later.',
    504: 'Gateway timeout. Please try again.',
  };

  /// Retrieves a user-friendly message for the given HTTP status code
  static String getHttpStatusMessage(int statusCode) {
    return httpStatusMessages[statusCode] ?? 'HTTP Error $statusCode occurred.';
  }
}

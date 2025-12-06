// ═══════════════════════════════════════════════════════════════
// API ENDPOINTS CLASS
// ═══════════════════════════════════════════════════════════════

/// Manages all API endpoint configurations and base URLs
///
/// This class follows the Single Responsibility Principle by containing
/// only endpoint-related constants and configurations.
abstract final class ApiConfig {
  // ========================== Base Endpoints =======================
  /// Base API URL for all requests
  static const String baseUrl = 'https://vcare.integration25.com/api/';

  /// API key for external service integration

  // ========================== Auth Endpoints =======================
  static const String auth = 'auth';
  static const String register = '$auth/register';
  static const String signIn = '$auth/login';
  static const String logout = '$auth/logout';

  // ========================== User Endpoints =======================
  // ========================== News Endpoints =======================
}

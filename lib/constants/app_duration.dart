// ═══════════════════════════════════════════════════════════════
// TIMING CONSTANTS
// ═══════════════════════════════════════════════════════════════
abstract final class AppDurations {
  // ----------------------------- Animations ----------------------------------

  /// Ultra-fast animations (100ms) - Micro-interactions, ripples
  static const Duration ultraFast = Duration(milliseconds: 100);

  /// Fast animations (200ms) - Quick transitions, hover effects
  static const Duration fast = Duration(milliseconds: 200);

  /// Standard animations (300ms) - Default UI transitions, dialogs
  static const Duration standard = Duration(milliseconds: 300);

  /// Medium animations (400ms) - Emphasized transitions, expansions
  static const Duration medium = Duration(milliseconds: 400);

  /// Slow animations (500ms) - Complex state changes, transformations
  static const Duration slow = Duration(milliseconds: 500);

  /// Extra slow animations (700ms) - Page transitions, hero animations
  static const Duration extraSlow = Duration(milliseconds: 700);

  // ----------------------------- Delays --------------------------------------

  /// Short delay (500ms) - Sequential animations, staggered effects
  static const Duration shortDelay = slow;

  /// Medium delay (1000ms) - Auto-dismiss notifications, tooltips
  static const Duration mediumDelay = Duration(seconds: 1);

  /// Long delay (2000ms) - Splash screens, loading states
  static const Duration longDelay = Duration(seconds: 2);

  /// Extra long delay (3000ms) - Snackbars, toast messages
  static const Duration extraLongDelay = Duration(seconds: 3);

  // ----------------------------- Timeouts ------------------------------------

  /// API request timeout (30s)
  static const Duration apiTimeout = Duration(seconds: 30);

  /// API connection timeout (15s)
  static const Duration apiConnectTimeout = Duration(seconds: 15);

  /// Debounce duration (300ms) - Search inputs, form validation
  static const Duration debounce = standard;

  /// Throttle duration (1000ms) - Button presses, scroll events
  static const Duration throttle = Duration(seconds: 1);
}

// ═══════════════════════════════════════════════════════════════
// DATE FORMATS CONSTANTS
// ═══════════════════════════════════════════════════════════════

import 'package:intl/intl.dart';

/// DateFormat constants for consistent date formatting throughout the app
/// Used for API (yyyy-MM-dd), UI display (M/d/yyyy), and detailed display (EEE, MMM d, yyyy)

abstract final class DateFormats {
  DateFormats._();

  /// Format for API: yyyy-MM-dd (e.g., 2025-04-14)
  static final DateFormat apiFormat = DateFormat('yyyy-MM-dd');

  /// Format for UI display: M/d/yyyy (e.g., 4/14/2025)
  static final DateFormat uiFormat = DateFormat.yMd();

  /// Format for detailed display: EEE, MMM d, yyyy (e.g., Mon, Apr 14, 2025)
  static final DateFormat detailedFormat = DateFormat('EEE, MMM d, yyyy');
}

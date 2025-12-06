// ═══════════════════════════════════════════════════════════════
// BORDER RADIUS CONSTANTS
// ═══════════════════════════════════════════════════════════════

abstract final class AppCorners {
  // ============================= Basic Sizes =================================

  /// No radius (0px) = Sharp corners
  static const double _none = 0;

  /// Extra small radius (4px) = Minimal rounding
  static const double _xs = 4;

  /// Small radius (8px) = Chips, badges, tags
  static const double _sm = 8;

  /// Medium radius (12px) = Cards, containers
  static const double _md = 12;

  /// Large radius (16px) = Buttons, inputs
  static const double _lg = 16;

  /// Extra large radius (20px) = Emphasized components
  static const double _xl = 20;

  /// 2X large radius (24px) = Dialogs, modals
  static const double _xxl = 24;

  /// 3X large radius (28px) = Bottom sheets, large cards
  static const double _xxxl = 28;

  /// Full radius (9999px) = Circular/pill shapes
  static const double _full = 9999;

  // ============================= Semantic ====================================

  /// Chips, badges, small tags
  static const double chip = _xs;

  /// Text fields, search bars, dropdowns
  static const double input = _lg;

  /// Standard cards and containers
  static const double card = _md;

  /// Buttons and interactive elements
  static const double button = _lg;

  /// Dialogs and modal windows
  static const double dialog = _xl;

  /// Bottom sheets and large surfaces
  static const double sheet = _xl;

  /// Snackbars
  static const double snackBar = _sm;

  /// Drop-down menus
  static const double dropDownMenu = _sm;

  /// Circular avatars and icons
  static const double circular = _full;

  /// Progress Indicator
  static const double progressIndicator = _full;

  /// For circular containers holding progress indicators (e.g., loading avatars)
  static const double progressIndicatorCircular = _full;

  /// For linear progress bars
  static const double progressIndicatorLinear = _xs; // 4dp
}

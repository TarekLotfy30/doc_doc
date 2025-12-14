// ═══════════════════════════════════════════════════════════════
// ELEVATION CONSTANTS
// ═══════════════════════════════════════════════════════════════

abstract final class AppElevation {
  AppElevation._();
  // ============================= Basic Levels ================================

  /// No elevation (0dp) = Flat surfaces, inline elements
  static const double _none = 0;

  /// Extra small elevation (1dp) = Minimal depth, subtle separation
  static const double _xs = 1;

  /// Small elevation (2dp) = Cards, chips, text fields
  static const double _sm = 2;

  /// Medium elevation (4dp) = Raised buttons, search bars
  static const double _md = 4;

  /// Large elevation (6dp) = FAB, prominent cards
  static const double _lg = 6;

  /// Extra large elevation (8dp) = Navigation bars, drawers
  static const double _xl = 8;

  /// 2X large elevation (12dp) = App bars (scrolled), menus
  static const double _xxl = 12;

  /// 3X large elevation (16dp) = Navigation drawer, side sheets
  static const double _xxxl = 16;

  /// Maximum elevation (24dp) = Dialogs, modal bottom sheets
  static const double _max = 24;

  // ============================= Semantic ====================================

  /// Cards and content containers
  static const double card = _sm;

  /// Standard buttons (outlined, text)
  static const double button = _none;

  /// Elevated/filled buttons
  static const double elevatedButton = _sm;

  /// DropDown Menu
  static const double dropDownMenu = _sm;

  /// Floating action button
  static const double fab = _lg;

  static const double highlightFab = _xxl;

  /// App bar in default state
  static const double appBar = _none;

  /// App bar when content scrolls beneath it
  static const double appBarScrolled = _xs;

  /// Bottom navigation bar
  static const double bottomNavigation = _xl;

  /// Navigation drawer
  static const double drawer = _xxxl;

  /// Modal dialogs and alerts
  static const double dialog = _max;

  /// Bottom sheets (modal)
  static const double bottomSheet = _max;

  /// Menus and dropdowns
  static const double menu = _xl;

  /// Snackbars and toasts
  static const double snackBar = _lg;

  /// Tooltips
  static const double tooltip = _md;

  /// Search bar
  static const double searchBar = _sm;

  /// Chips and tags
  static const double chip = _xs;
}

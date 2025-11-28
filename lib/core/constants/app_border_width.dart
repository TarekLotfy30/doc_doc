// ═══════════════════════════════════════════════════════════════
// BORDER WIDTH CONSTANTS
// ═══════════════════════════════════════════════════════════════

abstract final class AppBorderWidth {
  // ============================= Basic =======================================
  /// No border (0px) = Borderless components
  static const double _none = 0;

  /// Hairline border (0.5px) = Subtle dividers, disabled states
  static const double _hairline = 0.5;

  /// Thin border (1px) = Default state for most components
  static const double _thin = 1;

  /// Regular border (1.5px) = Focused or active states
  static const double _regular = 1.5;

  /// Medium border (2px) = Emphasized borders, selected items
  static const double _medium = 2;

  /// Thick border (2.5px) = Strong emphasis, error states
  static const double _thick = 2.5;

  /// Extra thick border (3px) = Maximum emphasis, primary CTAs
  static const double _extraThick = 3;

  // ============================= Semantic ====================================

  /// Default border width for neutral state
  static const double defaultWidth = _thin;

  /// Border width for hover state
  static const double hover = _regular;

  /// Border width for focused/active state
  static const double focused = _medium;

  /// Border width for selected state
  static const double selected = _medium;

  /// Border width for error/invalid state
  static const double error = _thick;

  /// Border width for disabled state
  static const double disabled = _hairline;
}

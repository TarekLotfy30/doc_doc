// ═══════════════════════════════════════════════════════════════
// INTERFACE FOR THEME COLORS
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';

abstract class IAppColors {
  // ===========================================================================
  // PRIMARY COLORS
  // ===========================================================================

  /// Main brand color used for primary actions such as ElevatedButtons,
  /// FloatingActionButtons, switches, and progress indicators.
  Color get primary;

  /// Text and icon color displayed on top of `primary`.
  Color get onPrimary;

  /// Background color for elevated surfaces such as cards or filled buttons.
  Color get primaryContainer;

  /// Text and icon color displayed on top of `primaryContainer`.
  Color get onPrimaryContainer;

  // ===========================================================================
  // SECONDARY COLORS
  // ===========================================================================

  /// used for chips, secondary buttons, and subtle highlights.
  Color get secondary;

  /// Text and icon color displayed on top of `secondary`.
  Color get onSecondary;

  /// Surface color for secondary elements such as chip backgrounds.
  Color get secondaryContainer;

  /// Text and icon color displayed on top of `secondaryContainer`.
  Color get onSecondaryContainer;

  // ===========================================================================
  // TERTIARY COLORS
  // ===========================================================================

  /// Tertiary accent color used for less prominent actions such as sliders
  /// and progress bars.
  Color get tertiary;

  /// Text and icon color displayed on top of `tertiary`.
  Color get onTertiary;

  /// Background surface for tertiary elements (cards, alerts, sheets).
  Color get tertiaryContainer;

  /// Text and icon color displayed on `tertiaryContainer`.
  Color get onTertiaryContainer;

  // ===========================================================================
  // SURFACE COLORS
  // ===========================================================================

  /// Main surface background for Scaffold, Cards, Sheets.
  Color get surface;

  /// Variant surface color used for subtle differentiation.
  Color get surfaceVariant;

  /// Bright surface used for high emphasis components.
  Color get surfaceBright;

  /// Dim surface used for low emphasis backgrounds.
  Color get surfaceDim;

  /// Surface tint color applied to components for Material elevation effects.
  Color get surfaceTint;

  /// Default card/container surface background.
  Color get surfaceContainer;

  /// Lowest surface level (Scaffold background).
  Color get surfaceContainerLowest;

  /// Low elevation surface (buttons, light cards).
  Color get surfaceContainerLow;

  /// High elevation surface (modals, sheets).
  Color get surfaceContainerHigh;

  /// Highest elevation surface (dialogs, menus).
  Color get surfaceContainerHighest;

  /// Primary text/icon color displayed on surfaces.
  Color get onSurface;

  /// Secondary text/icon color displayed on surfaces.
  Color get onSurfaceVariant;

  // ===========================================================================
  // ERROR COLORS
  // ===========================================================================

  /// Color used for error states (TextField borders, icons, alerts).
  Color get error;

  /// Text and icon color displayed on `error`.
  Color get onError;

  /// Background color for error banners, cards, and alerts.
  Color get errorContainer;

  /// Text and icon color displayed on top of `errorContainer`.
  Color get onErrorContainer;

  // ===========================================================================
  // BACKGROUND COLORS
  // ===========================================================================

  /// Main app background color.
  Color get background;

  /// Text and icon color displayed on background.
  Color get onBackground;

  // ===========================================================================
  // STATUS COLORS (SUCCESS / WARNING / INFO)
  // ===========================================================================

  /// Success state color (confirmation, completion).
  Color get success;

  /// Container surface for success elements.
  Color get successContainer;

  /// Text/icon shown on success color.
  Color get onSuccess;

  /// Text/icon shown on success container.
  Color get onSuccessContainer;

  /// Warning state color (caution, alerts).
  Color get warning;

  /// Container surface for warning elements.
  Color get warningContainer;

  /// Text/icon shown on warning color.
  Color get onWarning;

  /// Text/icon shown on warning container.
  Color get onWarningContainer;

  /// Info state color (informational banners, notes).
  Color get info;

  /// Container surface for info elements.
  Color get infoContainer;

  /// Text/icon shown on info color.
  Color get onInfo;

  /// Text/icon shown on info container.
  Color get onInfoContainer;

  // ===========================================================================
  // TEXT COLORS
  // ===========================================================================

  /// Primary text color (high emphasis).
  Color get textPrimary;

  /// Secondary text color (medium emphasis).
  Color get textSecondary;

  /// Tertiary text color (low emphasis).
  Color get textTertiary;

  /// Disabled text color.
  Color get textDisabled;

  /// Text color used for inverted surfaces.
  Color get textInverse;

  /// Color used for hyperlinks.
  Color get textLink;

  /// Placeholder and hint text color.
  Color get textPlaceholder;

  // ===========================================================================
  // BORDER COLORS
  // ===========================================================================

  /// Default border color.
  Color get border;

  /// Focus border color.
  Color get borderFocused;

  /// Error border color.
  Color get borderError;

  /// Success border color.
  Color get borderSuccess;

  // ===========================================================================
  // DIVIDER COLORS
  // ===========================================================================

  /// Default divider color.
  Color get divider;

  // ===========================================================================
  // OUTLINE COLORS
  // ===========================================================================

  /// Standard outline color for components.
  Color get outline;

  /// Faint outline color for subtle separators.
  Color get outlineVariant;

  // ===========================================================================
  // OVERLAY COLORS
  // ===========================================================================

  /// Hover overlay color.
  Color get hoverOverlay;

  /// Focus overlay color.
  Color get focusOverlay;

  /// Pressed overlay color.
  Color get pressedOverlay;

  /// Drag overlay color.
  Color get dragOverlay;

  /// Scrim color used behind modal components.
  Color get scrim;

  /// Shadow color used for elevated components.
  Color get shadow;

  // ===========================================================================
  // SPECIAL COLORS
  // ===========================================================================

  /// Inverse primary color for high contrast surfaces.
  Color get inversePrimary;

  /// Inverse surface color used for contrasting UI.
  Color get inverseSurface;

  /// Text and icon color displayed on inverse surfaces.
  Color get onInverseSurface;

  // ===========================================================================
  // COMPONENT-SPECIFIC COLORS
  // ===========================================================================

  /// App bar background color.
  Color get appBarBackground;

  /// App bar foreground (text/icon) color.
  Color get appBarForeground;

  /// Bottom navigation bar background.
  Color get bottomNavBackground;

  /// Color of selected bottom navigation items.
  Color get bottomNavSelected;

  /// Color of unselected bottom navigation items.
  Color get bottomNavUnselected;

  /// Card background color.
  Color get cardBackground;

  /// Dialog background color.
  Color get dialogBackground;

  /// Snackbar background color.
  Color get snackbarBackground;

  /// Tooltip background color.
  Color get tooltipBackground;

  /// Badge background color.
  Color get badgeBackground;

  /// Badge text color.
  Color get badgeText;

  /// Chip background color.
  Color get chipBackground;

  /// Chip selected background color.
  Color get chipSelectedBackground;

  /// Input field fill color.
  Color get inputBackground;

  /// Input field border color.
  Color get inputBorder;

  /// Input field focused border color.
  Color get inputFocusedBorder;

  /// Input field error border color.
  Color get inputErrorBorder;

  /// Disabled component background color.
  Color get disabledBackground;

  /// Disabled component foreground color.
  Color get disabledForeground;

  // ===========================================================================
  // ICON COLORS
  // ===========================================================================

  /// Primary icon color.
  Color get iconPrimary;

  /// Secondary icon color.
  Color get iconSecondary;

  /// Disabled icon color.
  Color get iconDisabled;

  /// Icon color displayed on primary surfaces.
  Color get iconOnPrimary;

  /// Icon color displayed on secondary surfaces.
  Color get iconOnSecondary;

  // ===========================================================================
  // SPECIAL-PURPOSE COLORS
  // ===========================================================================

  /// Shimmer base color for loading placeholders.
  Color get shimmerBase;

  /// Shimmer highlight color.
  Color get shimmerHighlight;

  /// Skeleton loader background color.
  Color get skeletonLoader;

  /// Ripple splash color.
  Color get splash;

  /// Highlight color for selections.
  Color get highlight;
}

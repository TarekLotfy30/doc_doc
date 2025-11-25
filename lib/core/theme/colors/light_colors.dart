// ═══════════════════════════════════════════════════════════════
// LIGHT THEME COLORS (Single Responsibility)
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import '../interface/i_app_colors.dart';
import 'app_colors.dart';

class LightColors implements IAppColors {
  // Primary Colors
  @override
  Color get primary => AppColors.primary;

  @override
  Color get primaryContainer => AppColors.primary20;
  @override
  Color get onPrimary => AppColors.white;
  @override
  Color get onPrimaryContainer => AppColors.text100;

  // Secondary Colors
  @override
  Color get secondary => AppColors.primary80;
  @override
  Color get secondaryContainer => AppColors.surfaceBlue;
  @override
  Color get onSecondary => AppColors.white;
  @override
  Color get onSecondaryContainer => AppColors.text100;

  // Tertiary Colors
  @override
  Color get tertiary => AppColors.fillGreen;
  @override
  Color get tertiaryContainer => AppColors.surfaceGreen;
  @override
  Color get onTertiary => AppColors.white;
  @override
  Color get onTertiaryContainer => AppColors.text100;

  // Error Colors
  @override
  Color get error => AppColors.fillRed;
  @override
  Color get errorContainer => AppColors.surfaceRed;
  @override
  Color get onError => AppColors.white;
  @override
  Color get onErrorContainer => AppColors.text100;

  // Surface Colors
  @override
  Color get surface => AppColors.surface;
  @override
  Color get surfaceVariant => AppColors.chat;
  @override
  Color get surfaceBright => AppColors.white;
  @override
  Color get surfaceDim => AppColors.text30;
  @override
  Color get surfaceTint => AppColors.primary;
  @override
  Color get surfaceContainer => AppColors.form;
  @override
  Color get surfaceContainerLowest => AppColors.white;
  @override
  Color get surfaceContainerLow => AppColors.chat;
  @override
  Color get surfaceContainerHigh => AppColors.surfaceText;
  @override
  Color get surfaceContainerHighest => AppColors.surfaceBlue;
  @override
  Color get onSurface => AppColors.text100;
  @override
  Color get onSurfaceVariant => AppColors.text80;

  // Background Colors
  @override
  Color get background => AppColors.white;
  @override
  Color get onBackground => AppColors.text100;

  // Status Colors - Success
  @override
  Color get success => AppColors.fillGreen;
  @override
  Color get successContainer => AppColors.surfaceGreen;
  @override
  Color get onSuccess => AppColors.white;
  @override
  Color get onSuccessContainer => AppColors.text100;

  // Status Colors - Warning
  @override
  Color get warning => AppColors.warning;
  @override
  Color get warningContainer => AppColors.warning20;
  @override
  Color get onWarning => AppColors.text100;
  @override
  Color get onWarningContainer => AppColors.text100;

  // Status Colors - Info
  @override
  Color get info => AppColors.fillBlue;
  @override
  Color get infoContainer => AppColors.surfaceBlue;
  @override
  Color get onInfo => AppColors.white;
  @override
  Color get onInfoContainer => AppColors.text100;

  // Text Colors
  @override
  Color get textPrimary => AppColors.text100;
  @override
  Color get textSecondary => AppColors.text80;
  @override
  Color get textTertiary => AppColors.body;
  @override
  Color get textDisabled => AppColors.text60;
  @override
  Color get textInverse => AppColors.white;
  @override
  Color get textLink => AppColors.primary;
  @override
  Color get textPlaceholder => AppColors.text60;

  // Border Colors
  @override
  Color get border => AppColors.text40;
  @override
  Color get borderFocused => AppColors.primary;
  @override
  Color get borderError => AppColors.fillRed;
  @override
  Color get borderSuccess => AppColors.fillGreen;

  // Divider Colors
  @override
  Color get divider => AppColors.text40;

  // Outline Colors
  @override
  Color get outline => AppColors.body;
  @override
  Color get outlineVariant => AppColors.text50;

  // Overlay Colors
  @override
  Color get hoverOverlay => AppColors.text100.withValues(alpha: 0.08);
  @override
  Color get focusOverlay => AppColors.primary.withValues(alpha: 0.12);
  @override
  Color get pressedOverlay => AppColors.primary.withValues(alpha: 0.12);
  @override
  Color get dragOverlay => AppColors.primary.withValues(alpha: 0.16);
  @override
  Color get scrim => AppColors.text100.withValues(alpha: 0.32);
  @override
  Color get shadow => AppColors.text100;

  // Special Colors
  @override
  Color get inversePrimary => AppColors.primary40;
  @override
  Color get inverseSurface => AppColors.text90;
  @override
  Color get onInverseSurface => AppColors.text20;

  // Component Specific Colors
  @override
  Color get appBarBackground => AppColors.white;
  @override
  Color get appBarForeground => AppColors.text100;
  @override
  Color get bottomNavBackground => AppColors.white;
  @override
  Color get bottomNavSelected => AppColors.primary;
  @override
  Color get bottomNavUnselected => AppColors.body;
  @override
  Color get cardBackground => AppColors.white;
  @override
  Color get dialogBackground => AppColors.white;
  @override
  Color get snackbarBackground => AppColors.text90;
  @override
  Color get tooltipBackground => AppColors.text90;
  @override
  Color get badgeBackground => AppColors.fillRed;
  @override
  Color get badgeText => AppColors.white;
  @override
  Color get chipBackground => AppColors.surfaceText;
  @override
  Color get chipSelectedBackground => AppColors.surfaceBlue;
  @override
  Color get inputBackground => AppColors.form;
  @override
  Color get inputBorder => AppColors.body;
  @override
  Color get inputFocusedBorder => AppColors.primary;
  @override
  Color get inputErrorBorder => AppColors.fillRed;
  @override
  Color get disabledBackground => AppColors.text40;
  @override
  Color get disabledForeground => AppColors.text60;

  // Icon Colors
  @override
  Color get iconPrimary => AppColors.text100;
  @override
  Color get iconSecondary => AppColors.text80;
  @override
  Color get iconDisabled => AppColors.text60;
  @override
  Color get iconOnPrimary => AppColors.white;
  @override
  Color get iconOnSecondary => AppColors.white;

  // Special Purpose Colors
  @override
  Color get shimmerBase => AppColors.text40;
  @override
  Color get shimmerHighlight => AppColors.text20;
  @override
  Color get skeletonLoader => AppColors.text40;
  @override
  Color get splash => AppColors.primary.withValues(alpha: 0.12);
  @override
  Color get highlight => AppColors.primary.withValues(alpha: 0.12);
}

// ============================================================================
// DIALOG THEME
// ============================================================================
import 'package:flutter/material.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';
import '../styles/app_font_family.dart';

abstract final class AppDialogTheme {
  AppDialogTheme._();
  static DialogThemeData dialogTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return DialogThemeData(
      elevation: AppElevation.dialog,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppCorners.dialog),
      ),
      backgroundColor: color.surface,
      surfaceTintColor: color.surfaceTint,

      titleTextStyle: typography.headlineLarge.copyWith(
        fontFamily: AppFontFamilyEnum.inter.name,
        color: color.onSurface,
      ),
      contentTextStyle: typography.bodyLarge.copyWith(
        fontFamily: AppFontFamilyEnum.inter.name,
        color: color.onSurfaceVariant,
      ),
      actionsPadding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      alignment: Alignment.center,
      iconColor: color.secondary,
      shadowColor: color.shadow.withValues(alpha: 0.28),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      barrierColor: color.scrim.withValues(alpha: 0.32),
    );
  }
}

// ============================================================================
// CARD THEME
// ============================================================================

import 'package:flutter/material.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../interface/i_app_colors.dart';

abstract final class AppCardTheme {
  AppCardTheme._();

  static CardThemeData cardTheme(IAppColors color) {
    return CardThemeData(
      elevation: AppElevation.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppCorners.card),
      ),
      surfaceTintColor: color.surfaceTint,
      margin: const EdgeInsets.only(bottom: 24),
      color: color.surface,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: color.shadow.withValues(alpha: 0.24),
    );
  }
}

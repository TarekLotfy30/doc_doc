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
      shadowColor: color.shadow,
      surfaceTintColor: color.onPrimary,
      margin: const EdgeInsets.only(bottom: 24),
      color: color.surface,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }
}

// ============================================================================
// BOTTOM SHEET THEME
// ============================================================================

import 'package:flutter/material.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../interface/i_app_colors.dart';

abstract final class AppBottomSheetTheme {
  const AppBottomSheetTheme._();

  static BottomSheetThemeData bottomSheetTheme(IAppColors color) {
    return BottomSheetThemeData(
      backgroundColor: color.surface,
      elevation: AppElevation.dialog,
      modalElevation: AppElevation.dialog,
      showDragHandle: true,
      surfaceTintColor: color.surface,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      dragHandleColor: color.onSurfaceVariant.withValues(alpha: 0.4),
      dragHandleSize: const Size(32, 4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppCorners.dialog),
        ),
      ),
      constraints: const BoxConstraints(maxWidth: 640),
    );
  }
}

// ============================================================================
// CHIP THEME
// ============================================================================
import 'package:flutter/material.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';
import '../styles/app_font_family.dart';

abstract final class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData chipTheme(IAppColors color, IAppTypography typography) {
    return ChipThemeData(
      backgroundColor: color.surfaceContainerLow,
      selectedColor: color.secondaryContainer,
      disabledColor: color.onSurface.withValues(alpha: 0.12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: typography.bodyLarge.copyWith(
        fontFamily: AppFontFamilyEnum.inter.name,
        color: color.onSurfaceVariant,
      ),
      secondaryLabelStyle: typography.bodyLarge.copyWith(
        fontFamily: AppFontFamilyEnum.inter.name,
        color: color.onSecondaryContainer,
      ),
      secondarySelectedColor: color.secondaryContainer,
      checkmarkColor: color.onSecondaryContainer,
      deleteIconColor: color.onSecondaryContainer,
      elevation: AppElevation.chip,
      pressElevation: AppElevation.chip * 2,
      iconTheme: IconThemeData(color: color.primary, size: 18),
      surfaceTintColor: color.surfaceTint,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color.outline.withValues(alpha: 0.2), width: 1),
        borderRadius: BorderRadius.circular(AppCorners.chip),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      side: BorderSide(color: color.outline.withValues(alpha: 0.2), width: 1),
      showCheckmark: true,
    );
  }
}

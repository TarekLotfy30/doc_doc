import 'package:flutter/material.dart';

import '../../../constants/app_corners.dart';
import '../../../constants/app_elevation.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';
import '../styles/app_font_family.dart';

abstract final class AppChipTheme {
  AppChipTheme._();
  static ChipThemeData chipTheme(IAppColors color, IAppTypography typography) {
    return ChipThemeData(
      backgroundColor: color.surface,
      selectedColor: color.primary,
      disabledColor: color.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // labelStyle: typography.labelSmall.copyWith(
      //   fontFamily: AppFontFamilyEnum.inter.name,
      // ),
      // secondaryLabelStyle: typography.labelSmall.copyWith(
      //   fontFamily: AppFontFamilyEnum.inter.name,
      // ),
      secondarySelectedColor: color.primary,
      checkmarkColor: color.onPrimary,
      // selectedShadowColor: color.shadow,
      // brightness: brightness,
      elevation: AppElevation.chip,
      iconTheme: IconThemeData(color: color.onSurface),
      pressElevation: AppElevation.chip,
      surfaceTintColor: color.onPrimary,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(AppCorners.chip),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
  }
}

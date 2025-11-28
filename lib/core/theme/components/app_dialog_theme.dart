import 'package:flutter/material.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: color.surface,
      titleTextStyle: typography.titleLarge.copyWith(
        fontFamily: AppFontFamilyEnum.inter.name,
      ),
      // contentTextStyle: typography.bodyMedium.copyWith(
      //   fontFamily: AppFontFamilyEnum.inter.name,
      // ),
      actionsPadding: const EdgeInsets.only(bottom: 16, top: 8),
      alignment: Alignment.center,
      iconColor: color.onSurface,
      //shadowColor: color.shadow,
      surfaceTintColor: color.onPrimary,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      insetPadding: const EdgeInsets.all(16),
      //barrierColor: color.shadow,
    );
  }
}

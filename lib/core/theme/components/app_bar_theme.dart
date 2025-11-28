import 'package:flutter/material.dart';

import '../../constants/app_elevation.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';
import '../styles/app_font_family.dart';

abstract final class AppBarThemes {
  AppBarThemes._();

  static AppBarTheme appBarTheme(IAppColors color, IAppTypography typography) {
    return AppBarTheme(
      backgroundColor: color.surface,
      foregroundColor: color.onSurface,
      elevation: AppElevation.appBar,
      scrolledUnderElevation: AppElevation.appBarScrolled,
      centerTitle: true,
      surfaceTintColor: color.primary,
      titleTextStyle: typography.headlineLarge.copyWith(
        color: color.onSurface,
        fontFamily: AppFontFamilyEnum.inter.name,
      ),
      toolbarTextStyle: typography.titleLarge.copyWith(
        color: color.onSurface,
        fontFamily: AppFontFamilyEnum.inter.name,
      ),
      actionsIconTheme: IconThemeData(color: color.onSurface),
      iconTheme: IconThemeData(color: color.onSurface),
      //shadowColor: color.shadow,
    );
  }
}

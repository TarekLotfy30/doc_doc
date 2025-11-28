// ═══════════════════════════════════════════════════════════════
// BASE THEME IMPLEMENTATION (Open for extension, closed for modification)
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

import 'components/app_bar_theme.dart';
import 'components/app_bottom_sheet_theme.dart';
import 'components/app_button_themes.dart';
import 'components/app_card_theme.dart';
import 'components/app_checkbox_theme.dart';
import 'components/app_chip_theme.dart';
import 'components/app_dialog_theme.dart';
import 'components/app_divider_theme.dart';
import 'components/app_drop_down_menu_theme.dart';
import 'components/app_input_theme.dart';
import 'components/app_progress_indicator.dart';
import 'components/app_scroll_bar_theme.dart';
import 'components/app_search_bar_theme.dart';
import 'components/app_switch_theme.dart';
import 'interface/i_app_colors.dart';
import 'interface/i_app_theme_data.dart';
import 'interface/i_app_typography.dart';
import 'styles/app_font_family.dart';
import 'theme_constants/theme_constants.dart';

class BaseAppTheme implements IAppThemeData {
  BaseAppTheme({required IAppColors colors, required IAppTypography textStyles})
    : _colors = colors,
      _textStyles = textStyles;

  final IAppColors _colors;
  final IAppTypography _textStyles;

  @override
  IAppColors get colors => _colors;

  @override
  IAppTypography get textStyles => _textStyles;

  @override
  ThemeData get materialTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: _getBrightness(),
      visualDensity: ThemeConstants.visualDensity,
      scaffoldBackgroundColor: _colors.background,
      fontFamily: AppFontFamilyEnum.inter.name,
      //pageTransitionsTheme: ThemeConstants.pageTransitionsTheme,

      // ======================== TEXT THEME ==============================
      textTheme: _buildTextTheme(),

      // ======================== COLOR SCHEME ==============================
      colorScheme: _buildColorScheme(),

      // ======================== INTERACTION ==============================
      hoverColor: _colors.primary.withValues(alpha: 0.08),
      splashColor: _colors.primary.withValues(alpha: 0.12),
      highlightColor: _colors.primary.withValues(alpha: 0.08),
      focusColor: _colors.primary.withValues(alpha: 0.12),

      // ======================== COMPONENTS ==============================
      appBarTheme: AppBarThemes.appBarTheme(_colors, _textStyles),
      bottomSheetTheme: AppBottomSheetTheme.bottomSheetTheme(_colors),
      floatingActionButtonTheme: AppButtonThemes.fabTheme(_colors),
      elevatedButtonTheme: AppButtonThemes.elevatedButtonTheme(
        _colors,
        _textStyles,
      ),
      outlinedButtonTheme: AppButtonThemes.outlinedButtonTheme(
        _colors,
        _textStyles,
      ),
      textButtonTheme: AppButtonThemes.textButtonTheme(_colors, _textStyles),
      cardTheme: AppCardTheme.cardTheme(_colors),
      checkboxTheme: AppCheckBoxTheme.checkboxTheme(_colors),
      chipTheme: AppChipTheme.chipTheme(_colors, _textStyles),
      dialogTheme: AppDialogTheme.dialogTheme(_colors, _textStyles),
      dividerTheme: AppDividerTheme.dividerTheme(_colors),
      inputDecorationTheme: AppInputTheme.inputDecorationTheme(
        _colors,
        _textStyles,
      ),
      switchTheme: AppSwitchTheme.switchTheme(_colors),
      searchBarTheme: AppSearchBarTheme.searchBarThemeData(
        _colors,
        _textStyles,
      ),
      scrollbarTheme: AppScrollBarTheme.scrollbarTheme(_colors),
      dropdownMenuTheme: AppDropDownMenuTheme.dropdownMenuTheme(
        _colors,
        _textStyles,
      ),
      progressIndicatorTheme: AppProgressIndicator.progressIndicatorTheme(
        _colors,
      ),
    );
  }

  TextTheme _buildTextTheme() {
    return TextTheme(
      displayLarge: _textStyles.displayLarge,
      headlineLarge: _textStyles.headlineLarge,
      titleLarge: _textStyles.titleLarge,
      bodyLarge: _textStyles.bodyLarge,
    );
  }

  ColorScheme _buildColorScheme() {
    return ColorScheme(
      brightness: _getBrightness(),
      primary: _colors.primary,
      onPrimary: _colors.onPrimary,
      primaryContainer: _colors.primaryContainer,
      onPrimaryContainer: _colors.onPrimaryContainer,
      secondary: _colors.secondary,
      onSecondary: _colors.onSecondary,
      secondaryContainer: _colors.secondaryContainer,
      onSecondaryContainer: _colors.onSecondaryContainer,
      tertiary: _colors.tertiary,
      onTertiary: _colors.onTertiary,
      tertiaryContainer: _colors.tertiaryContainer,
      onTertiaryContainer: _colors.onTertiaryContainer,
      surface: _colors.surface,
      onSurface: _colors.onSurface,
      surfaceContainerHighest: _colors.surfaceContainerHighest,
      surfaceContainerHigh: _colors.surfaceContainerHigh,
      surfaceContainer: _colors.surfaceContainer,
      surfaceContainerLow: _colors.surfaceContainerLow,
      surfaceContainerLowest: _colors.surfaceContainerLowest,
      onSurfaceVariant: _colors.onSurfaceVariant,
      outline: _colors.outline,
      outlineVariant: _colors.outlineVariant,
      shadow: _colors.shadow,
      scrim: _colors.scrim,
      inverseSurface: _colors.inverseSurface,
      onInverseSurface: _colors.onInverseSurface,
      inversePrimary: _colors.inversePrimary,
      surfaceTint: _colors.surfaceTint,
      error: _colors.error,
      onError: _colors.onError,
      errorContainer: _colors.errorContainer,
      onErrorContainer: _colors.onErrorContainer,
    );
  }

  // Helper method to determine brightness from colors
  Brightness _getBrightness() {
    // Simple heuristic: check if surface is lighter than mid-gray
    return _colors.surface.computeLuminance() > 0.5
        ? Brightness.light
        : Brightness.dark;
  }
}

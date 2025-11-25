// ═══════════════════════════════════════════════════════════════
// THEME FACTORY (Dependency Injection Pattern)
// ═══════════════════════════════════════════════════════════════

import 'base_app_theme.dart';
import 'colors/light_colors.dart';
import 'interface/i_app_theme_data.dart';
import 'styles/app_typography.dart';

class AppThemeFactory {
  AppThemeFactory._();

  static IAppThemeData get lightTheme {
    final colors = LightColors();
    final typography = AppTypography(baseColor: colors.textPrimary);
    return BaseAppTheme(colors: colors, textStyles: typography);
  }

  // static IAppThemeData darkTheme() {
  //   final colors = DarkColors();
  //   final typography = AppTypography(baseColor: colors.textPrimary);
  //   return BaseAppTheme(colors: colors, textStyles: typography);
  // }

  // Adding new themes is now trivial - no modification needed to BaseAppTheme!
  // static IAppThemeData createBlueTheme() {
  //   final colors = BlueThemeColors();
  //   final typography = AppTypography(baseColor: colors.textPrimary);
  //   return BaseAppTheme(colors: colors, textStyles: typography);
  // }
}

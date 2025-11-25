// ═══════════════════════════════════════════════════════════════
// INTERFACE FOR THEME DATA
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import 'i_app_colors.dart';
import 'i_app_typography.dart';

abstract class IAppThemeData {
  IAppColors get colors;
  IAppTypography get textStyles;
  ThemeData get materialTheme;
}

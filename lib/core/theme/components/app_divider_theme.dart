// ============================================================================
// DIVIDER THEME
// ============================================================================
import 'package:flutter/material.dart';

import '../interface/i_app_colors.dart';

abstract final class AppDividerTheme {
  AppDividerTheme._();
  static DividerThemeData dividerTheme(IAppColors color) {
    return DividerThemeData(
      color: color.divider,
      thickness: 1,
      space: 1,
      indent: 0,
      endIndent: 0,
    );
  }
}

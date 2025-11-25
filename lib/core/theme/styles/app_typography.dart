// ═══════════════════════════════════════════════════════════════
// TYPOGRAPHY CONSTANTS
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

import '../interface/i_app_typography.dart';
import 'app_font_weight.dart';

class AppTypography implements IAppTypography {
  const AppTypography({required this.baseColor});

  final Color baseColor;

  // ========================== Bold styles =================================
  @override
  TextStyle get displayLarge =>
      TextStyle(fontWeight: AppFontWeight.bold, color: baseColor);

  // ========================== SemiBold styles =============================
  @override
  TextStyle get headlineLarge =>
      TextStyle(fontWeight: AppFontWeight.semiBold, color: baseColor);

  // ========================== Medium styles ===============================
  @override
  TextStyle get titleLarge =>
      TextStyle(fontWeight: AppFontWeight.medium, color: baseColor);

  //  ========================== Regular styles =============================
  @override
  TextStyle get bodyLarge =>
      TextStyle(fontWeight: AppFontWeight.regular, color: baseColor);
}

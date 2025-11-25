// ═══════════════════════════════════════════════════════════════
// INTERFACE FOR THEME TEXT STYLES
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';

abstract class IAppTypography {
  // Bold
  TextStyle get displayLarge;

  // SemiBold
  TextStyle get headlineLarge;

  // Medium
  TextStyle get titleLarge;

  // Regular
  TextStyle get bodyLarge;
}

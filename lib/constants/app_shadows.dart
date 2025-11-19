// ═══════════════════════════════════════════════════════════════
// SHADOW CONSTANTS
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();
  // ----------------------------- Single Shadows ------------------------------

  /// Extra small shadow - Subtle depth for inline elements
  /// Opacity: 0.04, Blur: 2px, Offset: (0, 1)
  static List<BoxShadow> get xs => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  /// Small shadow - Cards, chips, raised surfaces
  /// Opacity: 0.05, Blur: 4px, Offset: (0, 2)
  static List<BoxShadow> get sm => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// Medium shadow - Buttons, dropdowns, tooltips
  /// Opacity: 0.1, Blur: 8px, Offset: (0, 4)
  static List<BoxShadow> get md => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Large shadow - Modals, drawers, elevated cards
  /// Opacity: 0.15, Blur: 16px, Offset: (0, 8)
  static List<BoxShadow> get lg => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.15),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  /// Extra large shadow - Dialogs, bottom sheets
  /// Opacity: 0.2, Blur: 24px, Offset: (0, 12)
  static List<BoxShadow> get xl => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.2),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];

  /// 2X large shadow - Maximum depth, overlays
  /// Opacity: 0.25, Blur: 32px, Offset: (0, 16)
  static List<BoxShadow> get xxl => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.25),
      blurRadius: 32,
      offset: const Offset(0, 16),
    ),
  ];

  // ----------------------------- Layered Shadows -----------------------------

  /// Soft layered shadow - Natural depth with multiple layers
  static List<BoxShadow> get soft => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  /// Medium layered shadow - Elevated surfaces with depth
  static List<BoxShadow> get medium => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  /// Strong layered shadow - Prominent elevation, modals
  static List<BoxShadow> get strong => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 32,
      offset: const Offset(0, 12),
    ),
  ];

  // ----------------------------- Semantic Shadows ----------------------------

  /// Card shadow - Standard card elevation
  static List<BoxShadow> get card => sm;

  /// Button shadow - Elevated button depth
  static List<BoxShadow> get button => xs;

  /// Input shadow - Text field focus state
  static List<BoxShadow> get input => xs;

  /// Dropdown shadow - Menu and dropdown elevation
  static List<BoxShadow> get dropdown => md;

  /// Modal shadow - Dialog and bottom sheet
  static List<BoxShadow> get modal => xl;

  /// Drawer shadow - Navigation drawer elevation
  static List<BoxShadow> get drawer => lg;

  /// Tooltip shadow - Tooltip elevation
  static List<BoxShadow> get tooltip => sm;

  /// FAB shadow - Floating action button
  static List<BoxShadow> get fab => medium;

  /// App bar shadow - Top navigation bar
  static List<BoxShadow> get appBar => xs;

  // ----------------------------- Colored Shadows -----------------------------

  /// Primary colored shadow - Brand color accent
  static List<BoxShadow> primaryShadow(Color color) => [
    BoxShadow(
      color: color.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  /// Success colored shadow - Green accent for success states
  static List<BoxShadow> get success => [
    BoxShadow(
      color: Colors.green.withValues(alpha: 0.2),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Error colored shadow - Red accent for error states
  static List<BoxShadow> get error => [
    BoxShadow(
      color: Colors.red.withValues(alpha: 0.2),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Warning colored shadow - Orange accent for warning states
  static List<BoxShadow> get warning => [
    BoxShadow(
      color: Colors.orange.withValues(alpha: 0.2),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  // ----------------------------- Special Effects -----------------------------

  /// Inner shadow effect - Inset depth illusion
  static List<BoxShadow> get inner => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 4,
      offset: const Offset(0, 2),
      spreadRadius: -2,
    ),
  ];

  /// Glow effect - Soft outer glow
  static List<BoxShadow> glowEffect(Color color, {double intensity = 0.4}) => [
    BoxShadow(
      color: color.withValues(alpha: intensity),
      blurRadius: 20,
      spreadRadius: 2,
    ),
  ];

  /// Custom shadow builder
  static List<BoxShadow> custom({
    required double opacity,
    required double blurRadius,
    required Offset offset,
    double spreadRadius = 0,
    Color color = Colors.black,
  }) => [
    BoxShadow(
      color: color.withValues(alpha: opacity),
      blurRadius: blurRadius,
      offset: offset,
      spreadRadius: spreadRadius,
    ),
  ];
}

// Basic shadows
// Container(
//   decoration: BoxDecoration(
//     boxShadow: AppShadows.md,
//   ),
// );

// Layered shadows for natural depth
// Container(
//   decoration: BoxDecoration(
//     boxShadow: AppShadows.soft,
//   ),
// );

// Semantic usage
// Card(
//   decoration: BoxDecoration(
//     boxShadow: AppShadows.card,
//   ),
// );

// Colored shadows
// Container(
//   decoration: BoxDecoration(
//     boxShadow: AppShadows.primaryShadow(Theme.of(context).primaryColor),
//   ),
// );

// Glow effect
// Container(
//   decoration: BoxDecoration(
//     boxShadow: AppShadows.glowEffect(Colors.blue, intensity: 0.5),
//   ),
// );

// Custom shadow
// Container(
//   decoration: BoxDecoration(
//     boxShadow: AppShadows.custom(
//       opacity: 0.15,
//       blurRadius: 10,
//       offset: Offset(0, 5),
//     ),
//   ),
// );

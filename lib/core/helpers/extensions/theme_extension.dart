import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get _appTheme => Theme.of(this);

  /// Gets the current color scheme from theme.
  ColorScheme get colorScheme => _appTheme.colorScheme;

  /// Gets the current text theme.
  TextTheme get textTheme => _appTheme.textTheme;

  /// Checks if device is in dark mode.
  bool get isDarkMode => _appTheme.brightness == Brightness.dark;
}

// Extension usage
// final theme = context.apptheme;
// final primaryColor = theme.primaryColor;
// final accentColor = theme.accentColor;
// final textTheme = theme.textTheme;

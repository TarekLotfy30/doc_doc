import 'package:flutter/material.dart';

abstract final class ThemeConstants {
  const ThemeConstants._();

  /// Standard page transitions for consistent navigation across platforms
  static const PageTransitionsTheme pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      // Cupertino-style transitions for Apple platforms
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),

      // Material fade transitions for all others
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    },
  );

  /// Visual density configuration for adaptive platform behavior
  static final VisualDensity visualDensity =
      VisualDensity.adaptivePlatformDensity;
}

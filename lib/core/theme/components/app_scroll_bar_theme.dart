import 'package:flutter/material.dart';

import '../interface/i_app_colors.dart';

abstract final class AppScrollBarTheme {
  const AppScrollBarTheme._();

  static ScrollbarThemeData scrollbarTheme(IAppColors color) {
    return ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all<Color>(color.primary),
      mainAxisMargin: 30,
      minThumbLength: 0.5,
      interactive: false,
      thumbVisibility: WidgetStateProperty.all<bool>(true),
      trackVisibility: WidgetStateProperty.all<bool>(true),
      thickness: WidgetStateProperty.all<double>(8),
      radius: const Radius.circular(6),
      trackColor: WidgetStateProperty.all<Color>(Colors.transparent),
      trackBorderColor: WidgetStateProperty.all<Color>(Colors.transparent),
    );
  }
}

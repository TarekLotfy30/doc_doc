import 'package:flutter/material.dart';

import '../interface/i_app_colors.dart';

abstract final class AppProgressIndicator {
  AppProgressIndicator._();

  static ProgressIndicatorThemeData progressIndicatorTheme(IAppColors color) {
    return ProgressIndicatorThemeData(
      color: color.primary,
      circularTrackColor: color.onPrimary,
      linearTrackColor: color.onPrimary,
      borderRadius: BorderRadius.circular(10),
      circularTrackPadding: const EdgeInsets.all(2),
      constraints: BoxConstraints.tight(const Size.fromRadius(20)),
    );
  }
}

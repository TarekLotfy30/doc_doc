// ============================================================================
// PROGRESS INDICATOR THEME
// ============================================================================
import 'package:flutter/material.dart';

import '../../constants/app_corners.dart';
import '../interface/i_app_colors.dart';

abstract final class AppProgressIndicator {
  AppProgressIndicator._();

  static ProgressIndicatorThemeData progressIndicatorTheme(IAppColors color) {
    return ProgressIndicatorThemeData(
      color: color.primary,
      circularTrackColor: color.surfaceContainerHighest,
      linearTrackColor: color.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(AppCorners.progressIndicator),
      circularTrackPadding: const EdgeInsets.all(2),
      linearMinHeight: 4,
      constraints: BoxConstraints.tight(const Size.fromRadius(20)),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/app_corners.dart';
import '../../constants/app_elevation.dart';
import '../interface/i_app_colors.dart';

abstract final class AppBottomSheetTheme {
  const AppBottomSheetTheme._();

  static BottomSheetThemeData bottomSheetTheme(IAppColors color) {
    return BottomSheetThemeData(
      backgroundColor: color.surface,
      elevation: AppElevation.dialog,
      modalElevation: AppElevation.dialog,
      showDragHandle: true,
      surfaceTintColor: color.surface,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      //modalBackgroundColor: color.surfaceContainerLow,
      //backgroundColor: color.surfaceContainerLow,
      //dragHandleColor: color.inversePrimary,
      //dragHandleSize: const Size(48, 3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppCorners.dialog),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/app_border_width.dart';
import '../../constants/app_elevation.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';

abstract final class AppSearchBarTheme {
  const AppSearchBarTheme._();

  static SearchBarThemeData searchBarThemeData(
    IAppColors color,
    IAppTypography typography,
  ) {
    return SearchBarThemeData(
      // hintStyle: WidgetStateProperty.all<TextStyle>(
      //   typography.headlineSmall.copyWith(color: color.onSurface),
      // ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      elevation: WidgetStateProperty.all<double>(AppElevation.searchBar),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          side: BorderSide(color: color.outline, width: AppBorderWidth.focused),
          //borderRadius: BorderRadius.circular(AppCorners.input),
        ),
      ),
    );
  }
}

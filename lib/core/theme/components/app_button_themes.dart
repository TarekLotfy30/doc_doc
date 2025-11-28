// ============================================================================
// BUTTONS THEME
// ============================================================================
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_border_width.dart';
import '../../constants/app_corners.dart';
import '../../constants/app_duration.dart';
import '../../constants/app_elevation.dart';
import '../../constants/app_sizes.dart';
import '../interface/i_app_colors.dart';
import '../interface/i_app_typography.dart';
import '../styles/app_font_family.dart';
import '../styles/app_font_weight.dart';

abstract final class AppButtonThemes {
  const AppButtonThemes._();

  static ElevatedButtonThemeData elevatedButtonTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return color.primary.withValues(alpha: 0.38);
          }
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.88);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary.withValues(alpha: 0.92);
          }
          if (states.contains(WidgetState.focused)) {
            return color.primary;
          }
          return color.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return color.onPrimary.withValues(alpha: 0.38);
          }
          return color.onPrimary;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return color.onPrimary.withValues(alpha: 0.16);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.onPrimary.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.focused)) {
            return color.onPrimary.withValues(alpha: 0.12);
          }
          return Colors.transparent;
        }),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.disabled)) {
            return 0;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppElevation.button * 2;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppElevation.button * 1.5;
          }
          if (states.contains(WidgetState.focused)) {
            return AppElevation.button * 1.2;
          }
          return AppElevation.button;
        }),
        surfaceTintColor: WidgetStateProperty.all(color.primary),
        alignment: Alignment.center,
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCorners.button),
          );
        }),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 14.h)),
        minimumSize: WidgetStateProperty.all(
          Size(double.maxFinite, AppSizes.buttonHeightMD.h),
        ),
        textStyle: WidgetStateProperty.all(
          typography.displayLarge.copyWith(
            fontSize: 16.sp,
            fontWeight: AppFontWeight.semiBold,
            fontFamily: AppFontFamilyEnum.inter.name,
          ),
        ),
        animationDuration: AppDurations.fast,
        enableFeedback: true,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return color.surface.withValues(alpha: 0.38);
          }
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary.withValues(alpha: 0.04);
          }
          if (states.contains(WidgetState.focused)) {
            return color.surface;
          }
          return color.surface;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return color.onSurface.withValues(alpha: 0.38);
          }
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.92);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary;
          }
          return color.onSurface;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.12);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary.withValues(alpha: 0.06);
          }
          if (states.contains(WidgetState.focused)) {
            return color.primary.withValues(alpha: 0.08);
          }
          return Colors.transparent;
        }),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.disabled)) {
            return 0;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppElevation.button * 1.5;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppElevation.button * 1.2;
          }
          return AppElevation.button;
        }),
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color: color.primary.withValues(alpha: 0.38),
              width: AppBorderWidth.defaultWidth,
            );
          }
          if (states.contains(WidgetState.pressed)) {
            return BorderSide(
              color: color.primary.withValues(alpha: 0.92),
              width: AppBorderWidth.defaultWidth * 1.5,
            );
          }
          if (states.contains(WidgetState.hovered)) {
            return BorderSide(
              color: color.primary,
              width: AppBorderWidth.defaultWidth * 1.2,
            );
          }
          if (states.contains(WidgetState.focused)) {
            return BorderSide(
              color: color.primary,
              width: AppBorderWidth.defaultWidth * 1.2,
            );
          }
          return BorderSide(
            color: color.primary,
            width: AppBorderWidth.defaultWidth,
          );
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppCorners.button),
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        ),
        minimumSize: WidgetStateProperty.all(
          const Size(double.maxFinite, AppSizes.buttonHeightLG),
        ),
        textStyle: WidgetStateProperty.all(
          typography.titleLarge.copyWith(
            fontFamily: AppFontFamilyEnum.inter.name,
          ),
        ),
        animationDuration: const Duration(milliseconds: 200),
        enableFeedback: true,
      ),
    );
  }

  static FloatingActionButtonThemeData fabTheme(IAppColors color) {
    return FloatingActionButtonThemeData(
      backgroundColor: color.primary,
      foregroundColor: color.onPrimary,
      elevation: AppElevation.button,
      focusElevation: AppElevation.button * 1.2,
      hoverElevation: AppElevation.button * 1.5,
      highlightElevation: AppElevation.button * 2,
      disabledElevation: 0,
      shape: const CircleBorder(),
      enableFeedback: true,
    );
  }

  static TextButtonThemeData textButtonTheme(
    IAppColors color,
    IAppTypography typography,
  ) {
    return TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return color.surface.withValues(alpha: 0.38);
          }
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary.withValues(alpha: 0.04);
          }
          return color.surface;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return color.primary.withValues(alpha: 0.38);
          }
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.92);
          }
          return color.primary;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return color.primary.withValues(alpha: 0.12);
          }
          if (states.contains(WidgetState.hovered)) {
            return color.primary.withValues(alpha: 0.06);
          }
          if (states.contains(WidgetState.focused)) {
            return color.primary.withValues(alpha: 0.08);
          }
          return Colors.transparent;
        }),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppElevation.button * 1.2;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppElevation.button * 1.1;
          }
          return AppElevation.button;
        }),
        alignment: Alignment.center,
        textStyle: WidgetStateProperty.all(
          typography.bodyLarge.copyWith(
            fontFamily: AppFontFamilyEnum.inter.name,
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        animationDuration: AppDurations.fast,
        enableFeedback: true,
      ),
    );
  }
}

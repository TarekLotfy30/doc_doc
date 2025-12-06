import 'package:flutter/material.dart';

import '../constants/app_duration.dart';
import '../constants/app_icons.dart';
import '../constants/app_icons_sizes.dart';
import '../theme/colors/app_colors.dart';
import 'app_custom_text.dart';

class AppSnackBar {
  const AppSnackBar._();

  static Future<void> _showSnackBar(
    BuildContext context,
    String message,
    Color backgroundColor, {
    String? action,
    IconData? icon,
  }) async {
    if (context.mounted) {
      final messenger = ScaffoldMessenger.of(context);
      final theme = Theme.of(context);

      // Hide any existing snackbars first
      messenger.hideCurrentSnackBar();

      messenger.showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(
                  data: message,
                  textTheme: theme.textTheme.bodyLarge,
                  fontSize: 14,
                  color: theme.colorScheme.onInverseSurface,
                ),
              ),
              Icon(
                icon,
                color: theme.colorScheme.onInverseSurface,
                size: AppIconSizes.snackBar,
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(AppCorners.snackBar),
          // ),
          behavior: SnackBarBehavior.floating,
          // elevation: AppElevation.snackBar,
          duration: AppDurations.extraLongDelay,
          // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          dismissDirection: DismissDirection.endToStart,
          action: action != null
              ? SnackBarAction(
                  label: action,
                  onPressed: messenger.hideCurrentSnackBar,
                )
              : null,
        ),
      );
    }
  }

  /// Shows a success snackbar with a pre-defined style
  static Future<void> showSuccess(
    BuildContext context,
    String message, {
    String? action,
  }) async {
    return _showSnackBar(
      context,
      message,
      AppColors.fillGreen,
      action: action,
      icon: AppIcons.success,
    );
  }

  /// Shows an error snackbar with a pre-defined style
  static Future<void> showError(
    BuildContext context,
    String message, {
    String? action,
  }) async {
    return _showSnackBar(
      context,
      message,
      AppColors.fillRed,
      action: action,
      icon: AppIcons.error,
    );
  }

  /// Shows a warning snackbar with pre-defined styling
  static Future<void> showWarning(
    BuildContext context,
    String message, {
    String? action,
  }) async {
    return _showSnackBar(
      context,
      message,
      AppColors.warning,
      action: action,
      icon: AppIcons.warning,
    );
  }

  /// Shows an info snackbar with pre-defined styling
  static Future<void> showInfo(
    BuildContext context,
    String message, {
    String? action,
  }) async {
    return _showSnackBar(
      context,
      message,
      AppColors.primary,
      action: action,
      icon: AppIcons.info,
    );
  }
}

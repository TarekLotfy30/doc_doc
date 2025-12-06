// App Dialog - A centralized class for showing various types of dialogs
import 'package:flutter/material.dart';

import '../constants/app_animation.dart';
import '../constants/app_corners.dart';
import '../constants/app_duration.dart';
import '../helpers/classes/app_logger.dart';
import '../helpers/extensions/navigation_extension.dart';
import '../helpers/extensions/theme_extension.dart';
import 'app_custom_text.dart';
import 'app_loading_indicator.dart';

/// Dialog type enumeration
enum DialogType { success, error, warning, info, confirmation, custom }

class AppDialog {
  const AppDialog._();

  /// Shows a generic dialog with custom content and animations
  static Future<T?> showGeneric<T>(
    BuildContext context, {
    required Widget Function(BuildContext, Animation<double>, Animation<double>)
    pageBuilder,
    bool barrierDismissible = false,
    Duration transitionDuration = AppDurations.fast,
    double blurAmount = 3.0,
  }) async {
    if (!context.mounted) {
      return null;
    }

    Logger.debug(
      'Showing generic dialog with blur amount: $blurAmount'
          'and transition duration: $transitionDuration',
      'AppDialog.showGeneric',
    );

    return showGeneralDialog<T>(
      context: context,
      transitionDuration: transitionDuration,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black45,
      pageBuilder: (ctx, anim1, anim2) => pageBuilder(ctx, anim1, anim2),
      transitionBuilder: (_, anim, _, widget) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: anim,
            curve: AppAnimations.decelerate,
          ).drive(Tween(begin: 0.9, end: 1.0)),
          child: FadeTransition(opacity: anim, child: widget),
        );
      },
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    );
  }

  /// Shows an animated dialog with fade and scale transitions
  static Future<T?> showAnimated<T>({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) async {
    if (!context.mounted) {
      return null;
    }

    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black45,
      transitionDuration: AppDurations.fast,
      transitionBuilder: (ctx, animation, _, widget) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: AppAnimations.decelerate,
              ),
            ),
            child: widget,
          ),
        );
      },
      pageBuilder: (_, _, _) => child,
    );
  }

  /// Shows a confirmation dialog
  static Future<bool> showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    bool isDanger = false,
  }) async {
    if (!context.mounted) {
      return false;
    }

    return await showGeneric<bool>(
          context,
          barrierDismissible: true,
          pageBuilder: (context, _, _) => AlertDialog(
            title: Text(title),
            content: Text(message),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCorners.dialog),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelText),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDanger
                      ? context.colorScheme.error
                      : context.colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  context.navigator.pop(true);
                },
                child: Text(confirmText),
              ),
            ],
          ),
        ) ??
        false;
  }

  /// Shows a styled status dialog (success, error, warning, info)
  static Future<T?> _showStatus<T>({
    required BuildContext context,
    required DialogType type,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onButtonPressed,
    bool barrierDismissible = true,
    Duration? autoCloseDuration = AppDurations.apiConnectTimeout,
  }) async {
    if (!context.mounted) {
      return null;
    }

    Logger.debug('Showing $type dialog: "$title"', 'AppDialog._showStatus');

    final result = showGeneric<T>(
      context,
      barrierDismissible: barrierDismissible,
      pageBuilder: (context, _, _) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppCorners.dialog),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 160,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDialogIcon(context, type),
                  const SizedBox(height: 16),
                  CustomText(
                    data: title,
                    textTheme: context.textTheme.headlineSmall,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  CustomText(
                    data: message,
                    textTheme: context.textTheme.bodyMedium,
                    color: context.colorScheme.onSurface.withOpacity(0.7),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getDialogColor(context, type),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppCorners.dialog,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (onButtonPressed != null) {
                          onButtonPressed();
                        }
                        context.navigator.pop();
                      },
                      child: CustomText(data: buttonText ?? 'OK'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // Auto-close if duration is specified
    if (autoCloseDuration != null) {
      Future.delayed(autoCloseDuration, () {
        if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      });
    }

    return result;
  }

  /// Shows a success dialog
  static Future<T?> showSuccess<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onButtonPressed,
    bool barrierDismissible = true,
    Duration? autoCloseDuration,
  }) async {
    if (!context.mounted) {
      return null;
    }

    return _showStatus<T>(
      context: context,
      type: DialogType.success,
      title: title,
      message: message,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      barrierDismissible: barrierDismissible,
      autoCloseDuration: autoCloseDuration,
    );
  }

  /// Shows an error dialog
  static Future<T?> showError<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onButtonPressed,
    bool barrierDismissible = true,
  }) async {
    if (!context.mounted) {
      return null;
    }

    return _showStatus<T>(
      context: context,
      type: DialogType.error,
      title: title,
      message: message,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      barrierDismissible: barrierDismissible,
    );
  }

  /// Shows a warning dialog
  static Future<T?> showWarning<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onButtonPressed,
    bool barrierDismissible = true,
  }) async {
    if (!context.mounted) {
      return null;
    }

    return _showStatus<T>(
      context: context,
      type: DialogType.warning,
      title: title,
      message: message,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      barrierDismissible: barrierDismissible,
    );
  }

  /// Shows an info dialog
  static Future<T?> showInfo<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onButtonPressed,
    bool barrierDismissible = true,
  }) async {
    if (!context.mounted) {
      return null;
    }

    return _showStatus<T>(
      context: context,
      type: DialogType.info,
      title: title,
      message: message,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      barrierDismissible: barrierDismissible,
    );
  }

  /// Shows an input dialog with a text field
  static Future<String?> showInput({
    required BuildContext context,
    required String title,
    String? message,
    String? hintText,
    String? initialValue,
    String confirmText = 'Submit',
    String cancelText = 'Cancel',
    TextInputType keyboardType = TextInputType.text,
    int? maxLines = 1,
    int? maxLength,
    String? Function(String?)? validator,
  }) async {
    if (!context.mounted) {
      return null;
    }

    final controller = TextEditingController(text: initialValue);
    final formKey = GlobalKey<FormState>();

    return showGeneric<String>(
      context,
      barrierDismissible: true,
      pageBuilder: (context, _, _) => AlertDialog(
        title: Text(title),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message != null) ...[
                Text(message),
                const SizedBox(height: 16),
              ],
              TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                maxLines: maxLines,
                maxLength: maxLength,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppCorners.dialog),
                  ),
                ),
                validator: validator,
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppCorners.dialog),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                Navigator.of(context).pop(controller.text);
              }
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  /// Shows a loading dialog
  static Future<T?> showLoading<T>({
    required BuildContext context,
    String? message,
    bool barrierDismissible = false,
  }) async {
    if (!context.mounted) {
      return null;
    }

    return showGeneric<T>(
      context,
      barrierDismissible: barrierDismissible,
      pageBuilder: (context, _, _) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(AppCorners.dialog),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppLoadingIndicator(),
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Helper function to build dialog icon based on type
  static Widget _buildDialogIcon(BuildContext context, DialogType type) {
    IconData iconData;
    Color color;

    switch (type) {
      case DialogType.success:
        iconData = Icons.check_circle;
        color = Colors.green;
      case DialogType.error:
        iconData = Icons.error;
        color = context.colorScheme.error;
      case DialogType.warning:
        iconData = Icons.warning;
        color = Colors.orange;
      case DialogType.info:
        iconData = Icons.info;
        color = Colors.blue;
      default:
        iconData = Icons.help;
        color = context.colorScheme.primary;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, size: 48, color: color),
    );
  }

  /// Helper function to get dialog color based on type
  static Color _getDialogColor(BuildContext context, DialogType type) {
    switch (type) {
      case DialogType.success:
        return Colors.green;
      case DialogType.error:
        return context.colorScheme.error;
      case DialogType.warning:
        return Colors.orange;
      case DialogType.info:
        return Colors.blue;
      default:
        return context.colorScheme.primary;
    }
  }
}

/// ============================================================================
/// USAGE EXAMPLES
/// ============================================================================

/// Example 1: Success Dialog
/// ```dart
/// AppDialog.showSuccess(
///   context: context,
///   title: 'Success!',
///   message: 'Your operation was completed successfully.',
///   buttonText: 'Great!',
///   autoCloseDuration: Duration(seconds: 3),
/// );
/// ```

/// Example 2: Error Dialog
/// ```dart
/// AppDialog.showError(
///   context: context,
///   title: 'Error',
///   message: 'Something went wrong. Please try again.',
///   buttonText: 'Retry',
///   onButtonPressed: () {
///     // Retry logic here
///   },
/// );
/// ```

/// Example 3: Warning Dialog
/// ```dart
/// AppDialog.showWarning(
///   context: context,
///   title: 'Warning',
///   message: 'This action cannot be undone. Are you sure?',
///   buttonText: 'I Understand',
/// );
/// ```

/// Example 4: Info Dialog
/// ```dart
/// AppDialog.showInfo(
///   context: context,
///   title: 'Information',
///   message: 'Your account will be upgraded in 24 hours.',
/// );
/// ```

/// Example 5: Confirmation Dialog
/// ```dart
/// final confirmed = await AppDialog.showConfirmation(
///   context: context,
///   title: 'Delete Item',
///   message: 'Are you sure you want to delete this item?',
///   confirmText: 'Delete',
///   cancelText: 'Cancel',
///   isDanger: true,
/// );
/// if (confirmed) {
///   // Perform deletion
/// }
/// ```

/// Example 6: Input Dialog
/// ```dart
/// final name = await AppDialog.showInput(
///   context: context,
///   title: 'Enter Your Name',
///   hintText: 'John Doe',
///   validator: (value) {
///     if (value == null || value.isEmpty) {
///       return 'Please enter a name';
///     }
///     return null;
///   },
/// );
/// if (name != null) {
///   print('User entered: $name');
/// }
/// ```

/// Example 7: Loading Dialog
/// ```dart
/// AppDialog.showLoading(
///   context: context,
///   message: 'Please wait...',
/// );
/// // Perform async operation
/// await Future.delayed(Duration(seconds: 2));
/// Navigator.of(context).pop(); // Close loading dialog
/// ```

/// Example 8: Bottom Sheet Dialog
/// ```dart
/// AppDialog.showBottomSheet(
///   context: context,
///   child: Padding(
///     padding: const EdgeInsets.all(20),
///     child: Column(
///       mainAxisSize: MainAxisSize.min,
///       children: [
///         ListTile(
///           leading: Icon(Icons.share),
///           title: Text('Share'),
///           onTap: () => Navigator.pop(context),
///         ),
///         ListTile(
///           leading: Icon(Icons.edit),
///           title: Text('Edit'),
///           onTap: () => Navigator.pop(context),
///         ),
///       ],
///     ),
///   ),
/// );
/// ```

/// Example 9: Custom Generic Dialog
/// ```dart
/// AppDialog.showGeneric(
///   context,
///   barrierDismissible: true,
///   pageBuilder: (context, anim1, anim2) {
///     return Center(
///       child: Container(
///         padding: const EdgeInsets.all(24),
///         decoration: BoxDecoration(
///           color: Theme.of(context).colorScheme.surface,
///           borderRadius: BorderRadius.circular(AppCorners.dialog),
///         ),
///         width: 300,
///         child: Column(
///           mainAxisSize: MainAxisSize.min,
///           children: [
///             Text('Custom Dialog'),
///             // Add your custom content here
///           ],
///         ),
///       ),
///     );
///   },
/// );
/// ```

/// Example 10: Animated Dialog
/// ```dart
/// AppDialog.showAnimated(
///   context: context,
///   child: AlertDialog(
///     title: Text("Hello"),
///     content: Text("Your animated dialog works."),
///   ),
/// );
/// ```

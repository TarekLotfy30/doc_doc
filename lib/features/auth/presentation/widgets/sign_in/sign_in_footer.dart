import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../config/routing/app_routes_name.dart';
import '../../../../../core/helpers/classes/app_navigation.dart';
import '../../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../../core/widgets/app_custom_text.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  /// Handles the tap action for terms/privacy links.
  Future<void> _handleTap(BuildContext context, String linkName) async {
    await AppNavigation.navigateTo(context, linkName);
  }

  /// Creates a tappable TextSpan for links.
  TextSpan _linkTextSpan({
    required BuildContext context,
    required String text,
    required String linkName,
  }) {
    return TextSpan(
      text: text,
      style: context.textTheme.bodyLarge?.copyWith(
        fontSize: 14,
        height: 1.5,
        color: context.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () => _handleTap(context, linkName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24,
      children: [
        // Terms and Conditions Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'By logging, you agree to our ',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 11,
                    height: 1.5,
                    color: context.colorScheme.outline,
                  ),
                ),
                _linkTextSpan(
                  context: context,
                  text: 'Terms & Conditions ',
                  linkName: 'Terms & Conditions',
                ),
                TextSpan(
                  text: 'and ',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 11,
                    height: 1.5,
                    color: context.colorScheme.outline,
                  ),
                ),
                _linkTextSpan(
                  context: context,
                  text: 'Privacy Policy',
                  linkName: 'Privacy Policy',
                ),
              ],
            ),
          ),
        ),
        // Sign Up Link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              data: "Don't have an account? ",
              textTheme: context.textTheme.bodyLarge,
              fontSize: 13,
              color: context.colorScheme.onSurface,
              height: 1.5,
            ),
            TextButton(
              onPressed: () async {
                await AppNavigation.navigateTo(
                  context,
                  AppRoutesName.signUpView,
                );
                await Future.delayed(const Duration(milliseconds: 200));
              },
              child: const CustomText(data: 'Sign Up'),
            ),
          ],
        ),
      ],
    );
  }
}

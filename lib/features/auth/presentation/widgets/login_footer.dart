import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/theme_extension.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  /// Handles the tap action for terms/privacy links.
  void _handleTap(String linkName) {
    // In a real app, this would navigate to the respective page or open a URL.
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
        fontSize: 11,
        height: 1.5,
        color: context.colorScheme.primary,
        fontWeight: FontWeight.bold, // Bolder link for better visibility
      ),
      recognizer: TapGestureRecognizer()..onTap = () => _handleTap(linkName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 24),

        // Sign Up Link
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Align(
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 13,
                      height: 1.5,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  _linkTextSpan(
                    context: context,
                    text: 'Sign Up',
                    linkName: 'Sign Up',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

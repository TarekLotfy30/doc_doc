import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/widgets/app_custom_text.dart';
import '../../../onboarding/presentation/widgets/doc_doc_logo_and_text.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Hero(tag: 'DocDocLogoAndText', child: DocDocLogoAndText()),
        const SizedBox(height: 24),
        CustomText(
          data: 'Welcome Back 👋',
          textTheme: context.textTheme.displayLarge,
          color: context.colorScheme.primary,
          fontSize: 28,
          height: 1.5,
          letterSpacing: -0.5,
        ),
        const SizedBox(height: 8),
        CustomText(
          data:
              "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          textTheme: context.textTheme.bodyLarge,
          fontSize: 14,
          color: context.colorScheme.outline,
          height: 1.6,
          letterSpacing: -0.2,
        ),
      ],
    );
  }
}

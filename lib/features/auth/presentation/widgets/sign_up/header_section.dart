import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../../core/widgets/app_custom_text.dart';
import '../../../../onboarding/presentation/widgets/doc_doc_logo_and_text.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Hero(tag: 'DocDocLogoAndText', child: DocDocLogoAndText()),
        const SizedBox(height: 24),
        CustomText(
          data: 'Create Account 📝',
          textTheme: context.textTheme.displayLarge,
          color: context.colorScheme.primary,
          fontSize: 28,
          height: 1.5,
          letterSpacing: -0.5,
        ),
        const SizedBox(height: 8),
        CustomText(
          data:
              "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
          textTheme: context.textTheme.bodyLarge,
          fontSize: 14,
          color: context.colorScheme.outline,
          height: 1.8,
          letterSpacing: 0.2,
        ),
      ],
    );
  }
}

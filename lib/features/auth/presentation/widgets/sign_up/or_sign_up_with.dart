import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../../core/widgets/app_custom_text.dart';

class OrSignUpDivider extends StatelessWidget {
  const OrSignUpDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        CustomText(
          data: 'Or Sign Up with',
          textTheme: context.textTheme.bodyLarge,
          fontSize: 12,
          color: context.colorScheme.outline,
          height: 1.5,
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}

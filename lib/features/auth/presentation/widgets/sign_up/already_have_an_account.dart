import 'package:flutter/material.dart';

import '../../../../../config/routing/app_routes_name.dart';
import '../../../../../core/helpers/classes/app_navigation.dart';
import '../../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../../core/widgets/app_custom_text.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          data: 'Already have an account? ',
          textTheme: context.textTheme.bodyLarge,
          fontSize: 13,
          color: context.colorScheme.onSurface,
          height: 1.5,
        ),
        TextButton(
          onPressed: () async {
            await AppNavigation.navigateToAndClearStack(
              context,
              AppRoutesName.signInView,
            );
          },
          child: const CustomText(data: 'Sign In'),
        ),
      ],
    );
  }
}

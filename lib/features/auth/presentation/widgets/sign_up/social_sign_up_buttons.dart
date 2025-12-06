import 'package:flutter/material.dart';

import '../../../../../core/constants/app_icons.dart';
import '../sign_in/social_button.dart';

class SocialSignUpButtons extends StatelessWidget {
  const SocialSignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(assetPath: AppIcons.google, onPressed: () => {}),
        SocialButton(assetPath: AppIcons.facebook, onPressed: () => {}),
        SocialButton(assetPath: AppIcons.apple, onPressed: () => {}),
      ],
    );
  }
}

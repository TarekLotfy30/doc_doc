import 'package:flutter/material.dart';

import '../../../../core/helpers/classes/app_navigation.dart';
import '../../../../config/routing/app_routes_name.dart';
import '../../../../core/widgets/app_custom_text.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await AppNavigation.navigateTo(context, AppRoutesName.signInView);
      },
      child: const CustomText(data: 'Get Started'),
    );
  }
}

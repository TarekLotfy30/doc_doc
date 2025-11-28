import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/widgets/app_custom_text.dart';
import '../../../../core/widgets/app_svg.dart';

// translate-me-ignore-all-file
class DocDocLogoAndText extends StatelessWidget {
  const DocDocLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppSVG(assetPath: AppImages.logo),
        const SizedBox(width: 10),
        CustomText(
          data: 'Docdoc',
          textTheme: context.textTheme.displayLarge,
          fontSize: 24,
        ),
      ],
    );
  }
}

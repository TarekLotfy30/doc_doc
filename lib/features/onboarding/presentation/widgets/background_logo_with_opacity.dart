import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/app_svg.dart';

class BackgroundLogoWithOpacity extends StatelessWidget {
  const BackgroundLogoWithOpacity({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppSVG(
      assetPath: AppImages.logoWithOpacity,
      fit: BoxFit.cover,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/widgets/app_svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
  });

  final String assetPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: context.colorScheme.secondaryContainer.withOpacity(0.5),
      //fillColor: context.colorScheme.onInverseSurface,
      padding: const EdgeInsets.all(7),
      disabledElevation: 0,
      elevation: 0,
      highlightElevation: 3, // Subtle lift on press for better visual feedback
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const CircleBorder(),
      child: SizedBox(
        height: 24,
        width: 24,
        child: AppSVG(assetPath: assetPath),
      ),
    );
  }
}

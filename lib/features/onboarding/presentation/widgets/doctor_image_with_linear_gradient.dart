import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/helpers/extensions/theme_extension.dart';

class DoctorImageWithLinearGradient extends StatelessWidget {
  const DoctorImageWithLinearGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            context.colorScheme.onPrimary,
            context.colorScheme.onPrimary.withValues(alpha: 0),
          ],
          stops: const [0.1, 0.45],
        ),
      ),
      child: Image.asset(AppImages.doctor),
    );
  }
}

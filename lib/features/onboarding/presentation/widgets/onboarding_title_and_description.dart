// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/widgets/app_custom_text.dart';

class OnboardingTitleAndDescription extends StatelessWidget {
  const OnboardingTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          data: 'Best Doctor\n Appointment App',
          textAlign: TextAlign.center,
          textTheme: context.textTheme.displayLarge,
          fontSize: 32,
          color: context.colorScheme.primary,
          height: 1.5,
        ),
        SizedBox(height: 18.h),
        CustomText(
          data:
              'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
          textAlign: TextAlign.center,
          fontSize: 10,
          textTheme: context.textTheme.bodyLarge,
          color: context.colorScheme.outline,
          height: 1.5,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_images.dart';
import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/widgets/app_custom_text.dart';
import '../../../../core/widgets/app_svg.dart';
import 'doc_doc_logo_and_text.dart';

// translate-me-ignore-all-file
class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            const DocDocLogoAndText(),
            SizedBox(height: 40.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Positioned.fill(
                  child: AppSVG(
                    assetPath: AppImages.logoWithOpacity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
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
                ),
                Positioned(
                  bottom: -133.h,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
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
                              // ignore: lines_longer_than_80_chars
                              'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                          textAlign: TextAlign.center,
                          fontSize: 10,
                          textTheme: context.textTheme.bodyLarge,
                          color: context.colorScheme.outline,
                          height: 1.5,
                        ),
                        SizedBox(height: 32.h),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Get Started'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

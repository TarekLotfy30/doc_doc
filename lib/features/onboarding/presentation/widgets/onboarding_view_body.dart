// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/helpers/classes/app_navigation.dart';
import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/routing/app_routes_name.dart';
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
            const Hero(tag: 'DocDocLogoAndText', child: DocDocLogoAndText()),
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
                PositionedDirectional(
                  start: 0,
                  end: 0,
                  top: 375.h,
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
                              'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                          textAlign: TextAlign.center,
                          fontSize: 10,
                          textTheme: context.textTheme.bodyLarge,
                          color: context.colorScheme.outline,
                          height: 1.5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () async {
                  await AppNavigation.navigateToAndClearStack(
                    context,
                    AppRoutesName.loginView,
                  );
                },
                child: const Text('Get Started'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

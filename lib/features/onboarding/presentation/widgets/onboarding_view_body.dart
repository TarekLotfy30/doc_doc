import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'background_logo_with_opacity.dart';
import 'doc_doc_logo_and_text.dart';
import 'doctor_image_with_linear_gradient.dart';
import 'get_started_button.dart';
import 'onboarding_title_and_description.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              const Hero(tag: 'DocDocLogoAndText', child: DocDocLogoAndText()),
              SizedBox(height: 40.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned.fill(child: BackgroundLogoWithOpacity()),
                  const DoctorImageWithLinearGradient(),
                  PositionedDirectional(
                    top: 375.h,
                    start: 0,
                    end: 0,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: OnboardingTitleAndDescription(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80.h),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: GetStartedButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_duration.dart';
import '../../../../core/constants/app_elevation.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/extensions/theme_extension.dart';
import '../../../../core/theme/colors/app_colors.dart';
import '../../../../core/widgets/app_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -1),
            spreadRadius: 0,
            blurStyle: BlurStyle.normal, // set blur style
          ),
        ],
      ),
      child: NavigationBar(
        height: 80.h,
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        animationDuration: AppDurations.fast,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: context.colorScheme.onPrimary,
        elevation: AppElevation.bottomNavigation,
        indicatorColor: Colors.transparent,
        indicatorShape: const CircleBorder(side: BorderSide.none),
        maintainBottomViewPadding: true,
        destinations: const [
          NavigationDestination(
            icon: AppSVG(assetPath: AppIcons.home),
            selectedIcon: AppSVG(
              assetPath: AppIcons.home,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              fit: BoxFit.cover,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: AppSVG(assetPath: AppIcons.message),
            selectedIcon: AppSVG(
              assetPath: AppIcons.message,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
            label: 'Message',
          ),
          NavigationDestination(
            icon: AppSVG(assetPath: AppIcons.calender),
            selectedIcon: AppSVG(
              assetPath: AppIcons.calender,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
            label: 'Calender',
          ),
          NavigationDestination(
            icon: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person),
            ),
            selectedIcon: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

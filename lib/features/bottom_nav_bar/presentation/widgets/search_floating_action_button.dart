import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/app_svg.dart';

class SearchFloatingActionButton extends StatelessWidget {
  const SearchFloatingActionButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 80.w,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          child: const AppSVG(assetPath: AppIcons.search),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.data,
    this.fontSize,
    this.textTheme,
    this.textAlign,
    this.color,
    this.height,
    this.letterSpacing,
  });

  final String data;
  final double? fontSize;
  final TextStyle? textTheme;
  final TextAlign? textAlign;
  final Color? color;
  final double? height;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: textTheme?.copyWith(
        color: color,
        fontSize: fontSize?.sp,
        height: height?.h,
        letterSpacing: letterSpacing?.w,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSVG extends StatelessWidget {
  const AppSVG({
    super.key,
    required this.assetPath,
    this.fit,
    this.semanticLabel,
    this.colorFilter,
  });

  final String assetPath;
  final BoxFit? fit;
  final String? semanticLabel;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      fit: fit ?? BoxFit.contain,
      semanticsLabel: semanticLabel,
      colorFilter: colorFilter,
      placeholderBuilder: (context) => const ColoredBox(
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}

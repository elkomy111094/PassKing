import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/resources.dart';

class SplashAnimatedLogo extends StatelessWidget {
  const SplashAnimatedLogo({
    Key? key,
    required this.logoAppearance,
  }) : super(key: key);

  final bool logoAppearance;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: logoAppearance ? 20.h : 0,
      width: logoAppearance ? 50.w : 0,
      duration: const Duration(seconds: 3),
      curve: Curves.easeInOut,
      child: Image.asset(
        Resources.svgLogo,
        height: logoAppearance ? 20.h : 0,
        width: logoAppearance ? 50.w : 0,
      ),
    );
  }
}

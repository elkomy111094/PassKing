import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';

class IndicatorIndividualUnit extends StatelessWidget {
  const IndicatorIndividualUnit(
      {super.key, required this.currentIndex, required this.currentUnitIndex});

  final int currentIndex;
  final int currentUnitIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 1.h,
      width: currentIndex == currentUnitIndex ? 8.w : 4.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.kPrimaryColor, AppColors.kBlackColor]),
        color: currentIndex == currentUnitIndex
            ? AppColors.kLightBlue
            : Colors.grey,
        borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(50), left: Radius.circular(50)),
      ),
    );
  }
}

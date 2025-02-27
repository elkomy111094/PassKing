
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';

class onboardingGreyBGContainer extends StatelessWidget {
  const onboardingGreyBGContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      color: AppColors.kLightWhite,
    );
  }
}
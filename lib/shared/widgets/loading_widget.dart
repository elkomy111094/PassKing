import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../shared/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: Center(
        child:LoadingAnimationWidget.fourRotatingDots(
          size: 4.h, color: AppColors.kMainColor,
        ),
      ),
    );
  }
}

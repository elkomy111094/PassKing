import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/resources.dart';

class LoginRegisterationheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 30.h,
            width: 100.w,
            color: AppColors.kMain,
            child: Padding(
              padding: EdgeInsets.all(5.h),
              child: Center(
                child: Image.asset(
                  Resources.svgLogo,
                  height: 30.h,
                  width: 100.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

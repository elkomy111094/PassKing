import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_text_button.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: CustomTextButton(
        onPressed: () {
          UI.push(AppRoutes.login);
        },
        text: "skip".tr,
        textSize: 16.sp,
        buttonHorizontalPaddingval: 10.w,
        roundedBorder: 2.h,
        textColor: AppColors.kBlackColor,
        borderColor: AppColors.kPrimaryColor,
      ),
    );
  }
}

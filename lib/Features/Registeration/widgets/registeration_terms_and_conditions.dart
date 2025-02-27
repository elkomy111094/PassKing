import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/constants/styles.dart';
import '../view_models/registeration_view_model.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.registerationViewModel,
  });

  final RegisterationViewModel registerationViewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: .75.sp,
              child: Checkbox(
                  activeColor: AppColors.kMain,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(.5.h)),
                  value: registerationViewModel.termsAndConditionsCheckState,
                  onChanged: (val) {
                    registerationViewModel.changeTermsAndConditionsState(val!);
                  }),
            ),
            RichText(
              text: TextSpan(
                  text: "agreeTermsAndConditions".tr,
                  style: AppStyles.kTextStyle12.copyWith(
                    color: AppColors.kBlue,
                    decoration: TextDecoration.underline,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

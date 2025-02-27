import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_text_button.dart';
import '../../../shared/constants/colors.dart';
import '../pages/complete_registeration_screen.dart';
import '../view_models/registeration_view_model.dart';

class CompleteRegisterationButton extends StatelessWidget {
  const CompleteRegisterationButton({
    super.key,
    required this.registerationViewModel,
    required this.deviceToken,
    required this.widget,
  });

  final RegisterationViewModel registerationViewModel;
  final String? deviceToken;
  final UserCompleteRegisterationScreen widget;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
        buttonColor: AppColors.kPrimaryColor,
        roundedBorder: 2.h,
        textSize: 16.sp,
        onPressed: () async {
          await registerationViewModel.completeRegisteration(
            deviceToken: deviceToken,
          );
        },
        text: "Register".tr);
  }
}

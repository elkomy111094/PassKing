import 'package:flutter/material.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_text_button.dart';

class LoginButton extends StatelessWidget {
  void Function()? onPressed;
  LoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
        buttonColor: AppColors.kPrimaryColor,
        roundedBorder: 2.h,
        textSize: 16.sp,
        onPressed: onPressed,
        text: "enter".tr);
  }
}

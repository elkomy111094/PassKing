import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_text_button.dart';
import '../../../shared/constants/colors.dart';

class ContinueButton extends StatelessWidget {
  final void Function()? onPressed;
  const ContinueButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
        buttonColor: AppColors.kMain,
        roundedBorder: 2.h,
        onPressed: onPressed,
        text: "متابعه".tr);
  }
}

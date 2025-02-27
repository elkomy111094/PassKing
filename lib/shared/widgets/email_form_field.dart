import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../components/square_text_field.dart';
import '../constants/styles.dart';
import '../resources.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  String? label;
  String? hint;

  EmailFormField({
    required this.controller,
    this.hint,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SquareTextField(
        preFixWidget: Padding(
          padding: EdgeInsets.all(2.h),
          child: SvgPicture.asset(
            Resources.emailIcon,
            width: 1.5.h,
            height: 1.5.h,
          ),
        ),
        textLetterSpaceing: 2,
        textStyle: AppStyles.kTextStyle14.copyWith(
          fontWeight: FontWeight.bold,
        ),
        hintStyle: AppStyles.kTextStyle14.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.kGreyColor,
        ),
        hintText: hint ?? "Write Your Email Here",
        controller: controller,
        validator: (emailVal) {
          if (emailVal!.isEmpty) {
            return "من فضلك أدخل البريد الإلكتروني";
          } else if ((!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(emailVal!))) {
            return "من فضلك أدخل بريد الكتروني صحيح";
          } else {
            return null;
          }
        },
        /*controller: inst.phoneNumberController,*/
        onChanged: (phone) {},
        keyBoardType: TextInputType.emailAddress,
      ),
    );
  }
}

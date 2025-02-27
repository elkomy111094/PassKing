import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pass_king/shared/components/square_text_field.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../constants/styles.dart';
import '../resources.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  String? hint;
  String? label;

  PasswordFormField({
    required this.controller,
    this.hint,
    this.label,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SquareTextField(
        textLetterSpaceing: 2,
        controller: widget.controller,
        textStyle: AppStyles.kTextStyle14.copyWith(
          fontWeight: FontWeight.bold,
        ),
        hintStyle: AppStyles.kTextStyle14.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.kGreyColor,
        ),
        preFixWidget: Padding(
          padding: EdgeInsets.all(2.h),
          child: SvgPicture.asset(
            Resources.lockerIcon,
            color: AppColors.kBlackColor,
            width: 1.5.h,
            height: 1.5.h,
          ),
        ),
        maxLength: 12,
        suffixWidget: IconButton(
          onPressed: () {
            setState(() {
              obsecure = !obsecure;
            });
          },
          icon: Icon(
            obsecure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
            color: AppColors.kPrimaryColor,
            size: 20.sp,
          ),
        ),
        hintText: widget.hint ?? "Write Your Password Here",
        obsecureance: obsecure,
        validator: (passWord) {
          if (passWord!.isEmpty) {
            return "من فضلك أدخل كلمة المرور";
          } else if (passWord.length < 6) {
            return "كلمه المرور يجب أن تكون 6 أحرف أو أكثر";
          } else {
            return null;
          }
        },
        /*controller: inst.phoneNumberController,*/
        onChanged: (phone) {},
        keyBoardType: TextInputType.text,
      ),
    );
  }
}

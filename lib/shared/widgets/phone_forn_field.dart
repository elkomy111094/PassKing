import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/styles.dart';
import '../../../shared/resources.dart';
import '../components/square_text_field.dart';
import '../constants/colors.dart';

class PhoneFormField extends StatelessWidget {
  final TextEditingController? controller;

  final String? label;

  final void Function(String)? onchange;

  const PhoneFormField({
    this.controller,
    this.onchange,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SquareTextField(
        textLetterSpaceing: 2,
        preFixWidget: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          mainAxisSize: MainAxisSize.min,
          children: [
            3.pw,
            Container(
                width: 3.h,
                height: 5.w,
                child: Flag.fromString('SA', height: 1, width: 1)),
            2.pw,
            Text(
              "+966",
              style: AppStyles.kTextStyle12.copyWith(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: AppColors.kGreenColor),
            ),
            SizedBox(
              width: 2.w,
            ),
          ],
        ),
        maxLength: 9,
        suffixWidget: Transform.rotate(
          angle: 36,
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: SvgPicture.asset(
              Resources.phoneIcon,
              width: 1.h,
              height: 1.h,
            ),
          ),
        ),
        textStyle: AppStyles.kTextStyle12.copyWith(fontFamily: "Montserrat"),
        hintText: "",
        controller: controller,
        validator: (value) {
          String pattern = r'[0-9]';
          RegExp regExp = RegExp(pattern);

          if (value == null || value.isEmpty || !regExp.hasMatch(value)) {
            return "من فضلك أدخل رقم هاتف صحيح";
          }
          if (value.length != 9) {
            return "رقم الهاتف يجب أن يكون 9 أرقام";
          }

          return null;
        },
        /*controller: inst.phoneNumberController,*/
        onChanged: onchange,
        keyBoardType: TextInputType.phone,
      ),
    );
  }
}

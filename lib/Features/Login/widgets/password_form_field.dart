import 'package:flutter/material.dart';
import 'package:pass_king/shared/components/square_text_field.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/styles.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SquareTextField(
      textLetterSpaceing: 2,
      labelText: "password".tr,
      textStyle: AppStyles.kTextStyle12.copyWith(fontFamily: "Montserrat"),
      preFixWidget: Icon(
        Icons.lock,
        color: AppColors.kLightBlue,
        size: 18.sp,
      ),
      maxLength: 8,
      hintText: "",
      obsecureance: true,
      suffixWidget: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.remove_red_eye,
          color: AppColors.kMain.withOpacity(.5),
          size: 18.sp,
        ),
      ),
      validator: (passWord) {
        if (passWord!.isEmpty) {
          return "هذا الحقل فارغ";
        } else {
          return null;
        }
      },
      /*controller: inst.phoneNumberController,*/
      onChanged: (phone) {},
      keyBoardType: TextInputType.text,
    );
  }
}

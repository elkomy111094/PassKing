import 'package:flutter/material.dart';
import 'package:pass_king/shared/components/square_text_field.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/styles.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SquareTextField(
      textLetterSpaceing: 2,
      preFixWidget: Icon(
        Icons.phone,
        color: AppColors.kLightBlue,
        size: 18.sp,
      ),
      labelText: "phoneNumber".tr,
      textStyle: AppStyles.kTextStyle12.copyWith(fontFamily: "Montserrat"),
      maxLength: 11,
      hintText: "",
      validator: (phoneVal) {
        if (phoneVal!.isEmpty) {
          return "هذا الحقل فارغ";
        } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{8,8}$)').hasMatch(phoneVal)) {
          return "من فضلك أدخل رقم هاتف صحيح";
        } else {
          return null;
        }
      },
      /*controller: inst.phoneNumberController,*/
      onChanged: (phone) {},
      keyBoardType: TextInputType.phone,
    );
  }
}

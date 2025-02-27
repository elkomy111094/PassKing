import 'package:flutter/material.dart';

import '../../../shared/components/square_text_field.dart';
import '../../../shared/constants/styles.dart';
import '../view_models/registeration_view_model.dart';

class FirstNameFormField extends StatelessWidget {
  const FirstNameFormField({
    super.key,
    required this.registerationViewModel,
  });

  final RegisterationViewModel registerationViewModel;

  @override
  Widget build(BuildContext context) {
    return SquareTextField(
      textLetterSpaceing: 2,
      textStyle: AppStyles.kTextStyle14.copyWith(fontWeight: FontWeight.bold),
      hintText: "Write your first name",
      controller: registerationViewModel.firstNameController,
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

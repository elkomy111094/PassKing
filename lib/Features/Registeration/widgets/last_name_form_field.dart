import 'package:flutter/material.dart';

import '../../../shared/components/square_text_field.dart';
import '../../../shared/constants/styles.dart';
import '../view_models/registeration_view_model.dart';

class LastNameFormField extends StatelessWidget {
  const LastNameFormField({
    super.key,
    required this.registerationViewModel,
  });

  final RegisterationViewModel registerationViewModel;

  @override
  Widget build(BuildContext context) {
    return SquareTextField(
      textLetterSpaceing: 2,
      controller: registerationViewModel.lastNameController,
      textStyle: AppStyles.kTextStyle14.copyWith(fontWeight: FontWeight.bold),
      hintText: "Write Your Last Name",
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

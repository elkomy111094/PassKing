import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/phone_forn_field.dart';
import '../view_models/registeration_view_model.dart';
import 'already_have_account_button.dart';
import 'register_button.dart';

class PhoneRegisterationForm extends StatelessWidget {
  const PhoneRegisterationForm({
    super.key,
    required this.registerationViewModel,
  });

  final RegisterationViewModel registerationViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Form(
        key: registerationViewModel.phoneRegisterationFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.ph,
            PhoneFormField(
              controller: registerationViewModel.phoneController,
            ),
            4.ph,
            BlocBuilder<GenericCubit, GenericCubitState>(
              bloc: registerationViewModel.registerationCubit,
              builder: (context, loginState) {
                return loginState is GenericLoadingState
                    ? const Loading()
                    : RegisterButton(onPressed: () async {
                        await registerationViewModel.registerPhoneToGetOTP();
                      });
              },
            ),
            SizedBox(
              height: 8.h,
            ),
            AlreadyHaveAccountButton(),
            5.ph,
          ],
        ),
      ),
    );
  }
}

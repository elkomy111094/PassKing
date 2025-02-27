import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/phone_forn_field.dart';
import '../view_models/reset_password_view_model.dart';
import 'continue_button.dart';

class PhoneRegisterationForm extends StatelessWidget {
  const PhoneRegisterationForm({
    super.key,
    required this.resetPasswordViewModel,
  });

  final ResetPPasswordViewModel resetPasswordViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Form(
        key: resetPasswordViewModel.phoneResetPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.ph,
            PhoneFormField(
              controller: resetPasswordViewModel.phoneController,
            ),
            4.ph,
            BlocBuilder<GenericCubit, GenericCubitState>(
              bloc: resetPasswordViewModel.resetPasswordCubit,
              builder: (context, loginState) {
                return loginState is GenericLoadingState
                    ? const Loading()
                    : ContinueButton(onPressed: () async {
                        await resetPasswordViewModel.sendOTPToResetPassword();
                      });
              },
            ),
            5.ph,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/components/custom_text_button.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/password_form_field.dart';
import '../../../shared/widgets/simple_Header.dart';
import '../view_models/reset_password_view_model.dart';

class UserResetPasswordScreen extends StatelessWidget {
  final ResetPPasswordViewModel resetPasswordViewModel;

  UserResetPasswordScreen({Key? key, required this.resetPasswordViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: resetPasswordViewModel.resetPasswordCubit,
      listener: (context, state) {
        if (state is GenericErrorState) {
          UI.showAlert(
            context,
            message: state.responseError?.message ?? "",
            type: MessageType.error,
          );
        } else if (state is GenericSucessRequestState) {
          UI.push(AppRoutes.login);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      child: Form(
                        key: resetPasswordViewModel.resetPasswordFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            2.ph,
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "NEW PASSWORD",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                    fontFamily: "Taga",
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        PasswordFormField(
                                            controller: resetPasswordViewModel
                                                .passwordController),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            5.ph,
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "CONFIRM NEW PASSWORD",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                    fontFamily: "Taga",
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        PasswordFormField(
                                            controller: resetPasswordViewModel
                                                .confirmPasswordController),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            5.ph,
                            BlocBuilder<GenericCubit, GenericCubitState>(
                              bloc: resetPasswordViewModel.resetPasswordCubit,
                              builder: (context, loginState) {
                                return loginState is GenericLoadingState
                                    ? const Loading()
                                    : SaveNewPassword(
                                        resetPPasswordViewModel:
                                            resetPasswordViewModel);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SimpleHeader(
                  headerTitle: "Change Your Password",
                  headerColor: AppColors.kPrimaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SaveNewPassword extends StatelessWidget {
  final ResetPPasswordViewModel resetPPasswordViewModel;

  const SaveNewPassword({
    super.key,
    required this.resetPPasswordViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
        buttonColor: AppColors.kPrimaryColor,
        textColor: Colors.white,
        roundedBorder: 1.h,
        textSize: 16.sp,
        onPressed: () async {
          await resetPPasswordViewModel.resetPassword();
        },
        text: "SEND");
  }
}

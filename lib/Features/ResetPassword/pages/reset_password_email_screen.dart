import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_text_button.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/styles.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/resources.dart';
import '../../../shared/util/ui.dart';
import '../../../shared/widgets/email_form_field.dart';
import '../view_models/reset_password_view_model.dart';

class ResetPasswordEmailScreen extends StatelessWidget {
  ResetPPasswordViewModel resetPasswordViewModel = ResetPPasswordViewModel();

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
        } else if (state is GenericUpdatedState) {
          UI.showAlert(
            context,
            message: "رقم التحقق هو : " + resetPasswordViewModel.otp,
            type: MessageType.success,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 33.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        color: AppColors.kPrimaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(5.h),
                          child: Center(
                            child: Image.asset(
                              Resources.svgLogo,
                              height: 30.h,
                              width: 100.w,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Align(
                          alignment: LanguageProvider().isArabicAppLanguage
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Row(
                            children: [
                              LanguageProvider().isArabicAppLanguage
                                  ? SizedBox()
                                  : Spacer(),
                              Container(
                                height: 6.h,
                                child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.h),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Center(
                                        child: Text(
                                      "RESET PASSWORD".tr,
                                      style: AppStyles.kTextStyle15.copyWith(
                                          color: AppColors.kPrimaryColor,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w900),
                                    )),
                                  ),
                                ),
                              ),
                              LanguageProvider().isArabicAppLanguage
                                  ? Spacer()
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        5.ph,
                        EmailFormField(controller: TextEditingController()),
                        3.ph,
                        CustomTextButton(
                            buttonColor: AppColors.kPrimaryColor,
                            textSize: 16.sp,
                            roundedBorder: 2.h,
                            onPressed: () {
                              UI.push(AppRoutes.forgetPasswordScreen,
                                  arguments: resetPasswordViewModel);
                            },
                            text: "SubMit".tr),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}

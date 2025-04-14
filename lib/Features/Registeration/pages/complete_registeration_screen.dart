import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:pass_king/shared/widgets/email_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/constants/styles.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/resources.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/password_form_field.dart';
import '../view_models/registeration_view_model.dart';
import '../widgets/complete_registeration_button.dart';
import '../widgets/first_name_form_field.dart';
import '../widgets/last_name_form_field.dart';

class UserCompleteRegisterationScreen extends StatefulWidget {
  UserCompleteRegisterationScreen();

  @override
  State<UserCompleteRegisterationScreen> createState() =>
      _UserCompleteRegisterationScreenState();
}

class _UserCompleteRegisterationScreenState
    extends State<UserCompleteRegisterationScreen> {
  RegisterationViewModel registerationViewModel = RegisterationViewModel();
  String? deviceToken;
  @override
  void initState() {
    FirebaseMessaging _firebaseMessaging =
        FirebaseMessaging.instance; // Chan// ge here
    _firebaseMessaging.getToken().then((token) {
      deviceToken = token!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: registerationViewModel.registerationCubit,
      listener: (context, state) {
        if (state is GenericErrorState) {
          UI.showAlert(
            context,
            message: state.responseError?.message ?? "",
            type: MessageType.error,
          );
        } else if (state is GenericSucessRequestState) {}
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
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
                                      "REGISTER".tr,
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
                    key: registerationViewModel.completeRegisterationFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FirstNameFormField(
                            registerationViewModel: registerationViewModel),
                        LastNameFormField(
                            registerationViewModel: registerationViewModel),
                        EmailFormField(
                            controller: registerationViewModel.emailController),
                        PasswordFormField(
                            controller:
                                registerationViewModel.passwordController),
                        2.ph,
                        BlocBuilder<GenericCubit, GenericCubitState>(
                          bloc: registerationViewModel.registerationCubit,
                          builder: (context, loginState) {
                            return loginState is GenericLoadingState
                                ? const Loading()
                                : CompleteRegisterationButton(
                                    registerationViewModel:
                                        registerationViewModel,
                                    deviceToken: deviceToken ?? "",
                                    widget: widget);
                          },
                        ),
                        2.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "If You Have An Account ?".tr,
                                style: AppStyles.kTextStyle14.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                              3.pw,
                              InkWell(
                                onTap: () {
                                  UI.pushReplacement(AppRoutes.login);
                                },
                                child: Container(
                                  height: 4.h,
                                  child: Center(
                                    child: Text(
                                      "login".tr,
                                      style: AppStyles.kTextStyle14.copyWith(
                                        color: AppColors.kPrimaryColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                        Image.asset(
                          "assets/images/biometric.jpg",
                          height: 15.h,
                          width: 15.h,
                        ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/Features/add_new_password/view_models/add_password_view_model.dart';
import 'package:pass_king/shared/generic_cubit/generic_cubit.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:pass_king/shared/util/ui.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';

class AddNewPasswordPage extends StatelessWidget {
  AddNewPasswordPage({super.key});
  AddPasswordViewModel viewModel = AddPasswordViewModel();
  InputDecoration buildInputDecoration(String label,
      {bool isPassword = false}) {
    return InputDecoration(
      labelText: label,
      labelStyle: AppStyles.kTextStyle16.copyWith(
        fontSize: 11.sp,
        fontFamily: "montserrat",
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final isPasswordVisible = ValueNotifier<bool>(false);

    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: viewModel.addPasswordCubit,
      listener: (context, state) {
        if (state is GenericErrorState) {
          UI.showAlert(
            context,
            message: state.responseError?.message ?? "",
            type: MessageType.error,
          );
        } else if (state is GenericUpdatedState) {
          UI.pushWithRemove(AppRoutes.homeScreen);
          UI.showAlert(
            context,
            message: "Password added successfully!",
            type: MessageType.success,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Form(
              key: viewModel.addPasswordFormKey,
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: EdgeInsets.all(1.5.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                            ),
                            child: Icon(Icons.arrow_back_ios_new, size: 18.sp),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "ADD NEW PASSWORD",
                          style: AppStyles.kTextStyle18.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Main Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                      child: Column(
                        children: [
                          SizedBox(height: 1.h),
                          TextFormField(
                            controller: viewModel.accountNameController,
                            decoration: buildInputDecoration('Website/App Name')
                                .copyWith(labelStyle: AppStyles.kTextStyle15),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Website/App name is required';
                              }
                              if (value.trim().length < 3) {
                                return 'Name must be at least 3 characters';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 2.h),

                          TextFormField(
                            controller: viewModel.linkController,
                            decoration: buildInputDecoration('Website/App Link')
                                .copyWith(labelStyle: AppStyles.kTextStyle15),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Website/App link is required';
                              }
                              final urlPattern =
                                  r'^(https?:\/\/)?([\w\-])+\.{1}([a-zA-Z]{2,63})([\/\w\-\.\?=&%]*)*\/?$';
                              final isValid =
                                  RegExp(urlPattern).hasMatch(value.trim());
                              if (!isValid) {
                                return 'Enter a valid link';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 2.h),

                          TextFormField(
                            controller: viewModel.emailController,
                            decoration: buildInputDecoration('Email / Username')
                                .copyWith(labelStyle: AppStyles.kTextStyle15),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email or username is required';
                              }
                              // Optional email validation
                              final emailPattern =
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                              final isEmail = value.contains('@');
                              if (isEmail &&
                                  !RegExp(emailPattern)
                                      .hasMatch(value.trim())) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 2.h),

// Password with Visibility Toggle
                          ValueListenableBuilder(
                            valueListenable: isPasswordVisible,
                            builder: (_, value, __) {
                              return TextFormField(
                                controller: viewModel.passwordController,
                                obscureText: !value,
                                decoration:
                                    buildInputDecoration('Password').copyWith(
                                  labelStyle: AppStyles.kTextStyle15,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      isPasswordVisible.value = !value;
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Password is required';
                                  }
                                  if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  final hasNumber =
                                      RegExp(r'\d').hasMatch(value);
                                  final hasUpper =
                                      RegExp(r'[A-Z]').hasMatch(value);
                                  final hasLower =
                                      RegExp(r'[a-z]').hasMatch(value);
                                  final hasSpecial =
                                      RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                          .hasMatch(value);

                                  return null;
                                },
                              );
                            },
                          ),

                          SizedBox(height: 2.h),
                          Center(
                            child: OutlinedButton(
                              onPressed: () {
                                UI.push(AppRoutes.generatePasswordPage);
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.red),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 1.5.h),
                              ),
                              child: Text(
                                "GENERATE NEW",
                                style: AppStyles.kTextStyle16.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Button
                  Padding(
                    padding: EdgeInsets.only(
                        left: 5.w, right: 5.w, bottom: 2.5.h, top: 1.h),
                    child: SizedBox(
                      width: double.infinity,
                      height: 6.5.h,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.addNewPassword();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 4,
                        ),
                        child: Text(
                          "ADD PASSWORD",
                          style: AppStyles.kTextStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

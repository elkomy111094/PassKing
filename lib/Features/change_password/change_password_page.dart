import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/Features/Profile/update_pofile_view_model.dart';
import 'package:pass_king/shared/generic_cubit/generic_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';
import '../../shared/prefs/pref_manager.dart';
import '../../shared/util/app_routes.dart';
import '../../shared/util/ui.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  bool _obscureOldPassword = true;

  final _formKey = GlobalKey<FormState>();

  UpdateUserProfileViewModel viewModel = UpdateUserProfileViewModel();

  final TextEditingController _oldPassword1Controller = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<GenericCubit, GenericCubitState>(
        bloc: viewModel.updateProfileCubit,
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
              message: "Password Has Been Updated",
              type: MessageType.error,
            );
            PrefManager.setCurrentUser(state.data).then((value) {});
            UI.pushWithRemove(AppRoutes.homeScreen);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 3.h),

                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_ios,
                              color: Colors.black, size: 18.sp),
                        ),
                        Text(
                          "CHANGE PASSWORD",
                          style: AppStyles.kTextStyle18.copyWith(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 18.sp),
                      ],
                    ),

                    SizedBox(height: 5.h),

                    // Label
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "CURRENT PASSWORD",
                        style: AppStyles.kTextStyle16.copyWith(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),

                    // Old Password
                    TextFormField(
                      controller: _oldPassword1Controller,
                      obscureText: _obscureOldPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your current password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter current password",
                        hintStyle: TextStyle(fontSize: 11.sp),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureOldPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() =>
                                _obscureOldPassword = !_obscureOldPassword);
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "NEW PASSWORD",
                        style: AppStyles.kTextStyle16.copyWith(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),

                    // New Password
                    TextFormField(
                      controller: _password1Controller,
                      obscureText: _obscurePassword1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a new password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter new password",
                        hintStyle: TextStyle(fontSize: 11.sp),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword1
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(
                                () => _obscurePassword1 = !_obscurePassword1);
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "CONFIRM NEW PASSWORD",
                        style: AppStyles.kTextStyle16.copyWith(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),

                    // Confirm Password
                    TextFormField(
                      controller: _password2Controller,
                      obscureText: _obscurePassword2,
                      validator: (value) {
                        if (value != _password1Controller.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Confirm new password",
                        hintStyle: TextStyle(fontSize: 11.sp),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword2
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(
                                () => _obscurePassword2 = !_obscurePassword2);
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),

                    SizedBox(height: 5.h),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 6.5.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.changePassword(
                              currentPassword:
                                  _oldPassword1Controller.text.trim(),
                              newPassword: _password1Controller.text.trim(),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 6,
                          shadowColor: Colors.redAccent,
                        ),
                        child: Text(
                          "CHANGE PASSWORD",
                          style: AppStyles.kTextStyle16.copyWith(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

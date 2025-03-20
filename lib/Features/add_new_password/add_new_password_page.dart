import 'package:flutter/material.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:pass_king/shared/util/ui.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';

class AddNewPasswordPage extends StatelessWidget {
  const AddNewPasswordPage({super.key});

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    TextField(
                      decoration: buildInputDecoration('Website/App Name'),
                    ),
                    SizedBox(height: 2.h),
                    TextField(
                      decoration: buildInputDecoration('Website/App Link'),
                    ),
                    SizedBox(height: 2.h),
                    TextField(
                      decoration: buildInputDecoration('Email / Username'),
                    ),
                    SizedBox(height: 2.h),

                    // Password with Visibility Toggle
                    ValueListenableBuilder(
                      valueListenable: isPasswordVisible,
                      builder: (_, value, __) {
                        return TextField(
                          controller: passwordController,
                          obscureText: !value,
                          decoration: buildInputDecoration('Password').copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                value ? Icons.visibility : Icons.visibility_off,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                isPasswordVisible.value = !value;
                              },
                            ),
                          ),
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
                    // Handle save
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
    );
  }
}

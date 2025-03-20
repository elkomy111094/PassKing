import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;

  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.h),

              // Header (نفس تصميم ProfilePage)
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

              // Label 1
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

              // Password 1 Field
              TextFormField(
                controller: _password1Controller,
                obscureText: _obscurePassword1,
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
                      setState(() => _obscurePassword1 = !_obscurePassword1);
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 4.h),

              // Label 2
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

              // Password 2 Field
              TextFormField(
                controller: _password2Controller,
                obscureText: _obscurePassword2,
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
                      setState(() => _obscurePassword2 = !_obscurePassword2);
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
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
                    // Change password logic
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
  }
}

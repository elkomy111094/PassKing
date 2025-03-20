import 'package:flutter/material.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:pass_king/shared/util/ui.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({super.key});

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
      TextEditingController(text: "Facebook");
  final TextEditingController linkController =
      TextEditingController(text: "www.facebook.com");
  final TextEditingController emailController =
      TextEditingController(text: "james.smith@mail.gg");
  final TextEditingController passwordController =
      TextEditingController(text: "ngPt_s92");

  bool isPasswordVisible = false;

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password updated successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back,
                        color: Colors.black, size: 20.sp),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "Update Password",
                    style: AppStyles.kTextStyle16.copyWith(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "montserrat",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              buildInputField("Name", nameController),
              SizedBox(height: 2.5.h),
              buildInputField("Link", linkController),
              SizedBox(height: 2.5.h),
              buildInputField("Email", emailController, isEmail: true),
              SizedBox(height: 2.5.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      style: AppStyles.kTextStyle16.copyWith(
                        fontFamily: "montserrat",
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: AppStyles.kTextStyle16.copyWith(
                          fontFamily: "montserrat",
                          color: Colors.black54,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red, width: 1.5),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.red,
                          ),
                          onPressed: () => setState(
                              () => isPasswordVisible = !isPasswordVisible),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Password cannot be empty" : null,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  ElevatedButton(
                    onPressed: () {
                      UI.push(AppRoutes.generatePasswordPage);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.w, vertical: 2.2.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "GENERATE\nNEW",
                      textAlign: TextAlign.center,
                      style: AppStyles.kTextStyle16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "montserrat",
                        fontSize: 9.5.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Center(
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.w, vertical: 2.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    "SAVE CHANGES",
                    style: AppStyles.kTextStyle16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "montserrat",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, TextEditingController controller,
      {bool isEmail = false}) {
    return TextFormField(
      controller: controller,
      style: AppStyles.kTextStyle16.copyWith(fontFamily: "montserrat"),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppStyles.kTextStyle16.copyWith(
          fontFamily: "montserrat",
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "$label cannot be empty";
        }
        if (isEmail && !value.contains('@')) {
          return "Enter a valid email";
        }
        return null;
      },
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';

class GeneratePasswordPage extends StatefulWidget {
  const GeneratePasswordPage({super.key});

  @override
  State<GeneratePasswordPage> createState() => _GeneratePasswordPageState();
}

class _GeneratePasswordPageState extends State<GeneratePasswordPage> {
  String generatedPassword = "";
  int passwordLength = 12;
  bool includeSymbols = true;
  bool isComplex = true;

  void generatePassword() {
    final letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';
    final symbols = '!@#\$%^&*()_+';

    String chars = letters;
    if (isComplex) chars += numbers;
    if (includeSymbols) chars += symbols;

    final rand = Random();
    final password = List.generate(
        passwordLength, (index) => chars[rand.nextInt(chars.length)]).join();

    setState(() {
      generatedPassword = password;
    });
  }

  void copyToClipboard() {
    if (generatedPassword.isEmpty) return;
    Clipboard.setData(ClipboardData(text: generatedPassword));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password copied to clipboard!")),
    );
  }

  InputDecoration buildInputDecoration(String label) {
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
                    "GENERATE PASSWORD",
                    style: AppStyles.kTextStyle18.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password Length: $passwordLength",
                      style: AppStyles.kTextStyle16.copyWith(
                        fontFamily: "montserrat",
                        fontSize: 11.5.sp,
                      ),
                    ),
                    Slider(
                      value: passwordLength.toDouble(),
                      min: 6,
                      max: 32,
                      divisions: 26,
                      activeColor: Colors.red,
                      label: passwordLength.toString(),
                      onChanged: (value) {
                        setState(() {
                          passwordLength = value.toInt();
                        });
                      },
                    ),
                    SizedBox(height: 1.5.h),
                    Row(
                      children: [
                        Checkbox(
                          value: isComplex,
                          activeColor: Colors.red,
                          onChanged: (value) =>
                              setState(() => isComplex = value!),
                        ),
                        Text("Include Numbers",
                            style: AppStyles.kTextStyle16
                                .copyWith(fontFamily: "montserrat")),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: includeSymbols,
                          activeColor: Colors.red,
                          onChanged: (value) =>
                              setState(() => includeSymbols = value!),
                        ),
                        Text("Include Symbols",
                            style: AppStyles.kTextStyle16
                                .copyWith(fontFamily: "montserrat")),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    TextField(
                      readOnly: true,
                      controller:
                          TextEditingController(text: generatedPassword),
                      style: AppStyles.kTextStyle16.copyWith(
                        fontFamily: "montserrat",
                        fontSize: 11.5.sp,
                      ),
                      decoration: buildInputDecoration("Generated Password"),
                    ),
                  ],
                ),
              ),
            ),

            // Buttons
            Padding(
              padding: EdgeInsets.only(
                  left: 5.w, right: 5.w, bottom: 2.5.h, top: 1.h),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 6.5.h,
                    child: ElevatedButton(
                      onPressed: copyToClipboard,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "COPY",
                        style: AppStyles.kTextStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  SizedBox(
                    width: double.infinity,
                    height: 6.5.h,
                    child: OutlinedButton(
                      onPressed: generatePassword,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "RANDOMIZE",
                        style: AppStyles.kTextStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

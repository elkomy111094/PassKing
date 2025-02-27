import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';

class SquareTextField extends StatelessWidget {
  String hintText;
  Widget? suffixWidget;
  int? maxLines;
  Widget? preFixWidget;
  String? Function(String?)? validator;
  String? Function(String?)? onSubmit;
  final TextEditingController? phoneController;

  void Function(String)? onChanged;

  TextEditingController? controller;

  bool obsecureance;

  Brightness? keyBoardAppearance;

  TextInputType? keyBoardType;

  Color? fillColor;

  int? maxLength;

  String? prefixText;

  double? textLetterSpaceing;

  TextStyle? textStyle;

  TextStyle? hintStyle;

  TextAlign? textAlign;

  String? labelText;

  bool? enableState;

  Widget? postFix;

  SquareTextField({
    required this.hintText,
    this.labelText,
    this.textLetterSpaceing = 0.0,
    this.enableState,
    this.hintStyle,
    this.postFix,
    this.textStyle,
    this.maxLength,
    this.onSubmit,
    this.prefixText,
    this.textAlign,
    this.preFixWidget,
    this.fillColor = Colors.white60,
    this.maxLines = 1,
    this.phoneController,
    this.keyBoardType,
    this.controller,
    this.validator,
    this.keyBoardAppearance,
    this.obsecureance = false,
    this.suffixWidget,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: TextFormField(
            textAlign: textAlign ?? TextAlign.start,
            cursorColor: AppColors.kMain,
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyBoardType,
            keyboardAppearance: keyBoardAppearance,
            controller: controller,
            maxLines: maxLines,
            maxLength: maxLength,
            obscuringCharacter: "•",
            obscureText: obsecureance,
            onFieldSubmitted: onSubmit,
            enabled: enableState,
            style: textStyle ??
                TextStyle(
                    color: Colors.black,
                    fontFamily: "Taga",
                    letterSpacing: textLetterSpaceing,
                    fontSize: 14.sp),
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 10.sp, fontFamily: "Taga"),
              fillColor: fillColor,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2.3.h, horizontal: 3.w),
              prefixText: prefixText,
              prefixStyle: TextStyle(
                  color: AppColors.kMain,
                  fontWeight: FontWeight.bold,
                  /*fontFamily: "Taga",*/
                  fontSize: 13.sp),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.h),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(.5),
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.h),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(.5),
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.h),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.h),
                  borderSide: BorderSide(color: AppColors.kMain, width: 1)),
              hintText: hintText,
              counterText: "",
              suffixIcon: suffixWidget,
              alignLabelWithHint: true,
              floatingLabelStyle: TextStyle(
                fontSize: 11.sp,
                letterSpacing: 0,
                fontFamily: "Taga",
                color: AppColors.kLightBlue,
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 11.sp,
                letterSpacing: 0,
                fontFamily: "Taga",
              ),
              prefixIcon: preFixWidget,
              hintStyle: hintStyle ??
                  TextStyle(color: Colors.black26, fontSize: 14.sp),
            ),
          ),
        ),
      ),
    );
  }
}

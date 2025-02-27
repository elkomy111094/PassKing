import 'dart:core';

import 'package:flutter/material.dart';



import 'package:sizer/sizer.dart';


import '../../shared/constants/colors.dart';
import '../constants/styles.dart';

import '../extensions/string_extensions.dart';


class CustomDropDownFormField extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? type;
  Function(dynamic val)? onSubmit;
  void Function(dynamic)? onChange;
  Function? onTap;
  bool isPassword = false;
  String? Function(dynamic)? validate;
  String? hintText;
  Color? fillColor;
  var textAlign;
  Widget? icon;
  String? prefixText;

  double? radius;
  double? heigh;

  String? label;
  var labelWidgets;
  var prefix;
  var suffix;
  Function? suffixPressed;
  bool isClickable = true;
  bool autofocus = false;
  var labelBehavior;
  var suffixText;
  var preFixWidget;
  String? selectedValue;

  int? maxLines;

  bool? enableState;
  List<DropdownMenuItem<Object>>? dropDownListItems;

  int? maxLenth;

  dynamic? drobDownValue;

  CustomDropDownFormField(
      {this.controller,
      this.enableState,
      this.icon,
      this.drobDownValue,
      this.type,
      this.selectedValue,
      this.hintText,
      this.maxLines = 1,
      this.labelBehavior,
      this.labelWidgets,
      required this.dropDownListItems,
      this.fillColor,
      this.maxLenth,
      this.onSubmit,
      this.onChange,
      this.heigh,
      this.onTap,
      this.prefixText,
      this.radius,
      this.suffixText,
      this.preFixWidget,
      this.isPassword = false,
      required this.validate,
      this.label,
      this.prefix,
      this.suffix,
      this.suffixPressed,
      this.isClickable = true,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:1.h ),
      child: Container(
        child: DropdownButtonFormField(
          onSaved: onChange,
          value: drobDownValue,
          alignment: Alignment.centerLeft,
          hint: Text(hintText ?? "",style: AppStyles.kTextStyle14.copyWith(color: AppColors.kGreyColor),),
          icon: icon,
          iconSize: getDeviceType() == "phone" ? 20.sp : 10.sp,
          style:AppStyles.kTextStyle10 ,
          onChanged: onChange,
          validator: validate,
          decoration: InputDecoration(
            prefixStyle: TextStyle(
                color: AppColors.kOrangeColor,
                fontWeight: FontWeight.bold,
                /*fontFamily: "Taga",*/
                fontSize: 10.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??10),
              borderSide: const BorderSide(color: AppColors.kGreyColor),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.5),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color: AppColors.kMain, width: 1)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??10),
              borderSide: const BorderSide(color: AppColors.kErrorColor),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: heigh ?? 2.h, horizontal: 3.w),
            prefix: preFixWidget,
            labelText: label,
            filled: true,
            fillColor: fillColor ?? Colors.transparent,
            label: labelWidgets,
            suffixText: suffixText,

            floatingLabelBehavior: labelBehavior,
            suffixStyle: TextStyle(color: AppColors.kOrangeColor),
            labelStyle:AppStyles.kTextStyle12,
            hintText: hintText,
            hintStyle: AppStyles.kTextStyle10.copyWith(color: AppColors.kGreyColor),
            /*prefixIconConstraints:
                BoxConstraints(maxHeight: 20.h, maxWidth: 50.w),*/
            prefixText: prefixText,
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: () => suffixPressed,
                    icon: icon!,
                  )
                : null,
          ),
          items: dropDownListItems ?? [DropdownMenuItem(child: Text(""))],
        ),
      ),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/styles.dart';

class CustomTextButton extends StatelessWidget {
  Color ?buttonColor;
  Color  ?textColor;
  double ?textSize;
  void Function() ? onPressed;
  String ?text;
  double? roundedBorder;
  Color? borderColor;
  double ?buttonHorizontalPaddingval;
  double ?buttonVerticalPaddingVal;
  double? hPadding;
  double? vPadding;

  CustomTextButton(
      {this.borderColor = Colors.white,
      this.roundedBorder = 1000,
      this.buttonColor,
      this.hPadding = 0,
      this.vPadding = 15,
      this.buttonHorizontalPaddingval = 0,
      this.buttonVerticalPaddingVal = 0,
        this.textColor,
      this.textSize,
        this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: buttonHorizontalPaddingval!,
          vertical: buttonVerticalPaddingVal!),
      // ignore: deprecated_member_use
      child: Container(
        height: 7.h,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedBorder!),
            side: BorderSide(color: borderColor??buttonColor ?? Colors.transparent, width: 1),
          ),
          elevation: 0,
          padding:
              EdgeInsets.symmetric(horizontal: hPadding!, vertical: vPadding!),
          color: buttonColor,
          child: Center(
            child: Text(
              text!,
              textAlign: TextAlign.center,
              style: AppStyles.kTextStyle13.copyWith(fontSize: textSize??11.sp ,color: textColor??Colors.white),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

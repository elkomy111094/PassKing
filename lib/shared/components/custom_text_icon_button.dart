import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextIconButton extends StatelessWidget {
  Color buttonColor;
  Color textColor;
  double textSize;
  Widget icon;
  void Function() onPressed;
  String text;
  double? roundedBorder;
  Color? borderColor;
  double buttonHorizontalPaddingval;
  double buttonVerticalPaddingVal;
  EdgeInsetsGeometry? contentPadding;

  CustomTextIconButton(
      {this.borderColor = Colors.white,
      this.roundedBorder = 50,
      required this.icon,
      this.contentPadding =
          const EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 0),
      required this.buttonColor,
      this.buttonHorizontalPaddingval = 30.0,
      this.buttonVerticalPaddingVal = 10.0,
      required this.textColor,
      required this.textSize,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: buttonHorizontalPaddingval,
          vertical: buttonVerticalPaddingVal),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedBorder!),
          side: BorderSide(color: borderColor!, width: 2),
        ),
        color: buttonColor,
        child: Padding(
          padding: contentPadding!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(1.5.h),
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: "Taga", fontSize: textSize, color: textColor),
                ),
              ),
              icon,
            ],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

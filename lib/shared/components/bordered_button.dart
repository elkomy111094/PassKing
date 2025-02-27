
import 'package:flutter/material.dart';



import '../../shared/constants/colors.dart';
import '../app_size.dart';



class BorderedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onClick;
  final double? height;
  final double? width;
  final double? textSize;
  final Color? btnColor;
  final Color? borderColor;
  final Color? textColor;

  const BorderedButton({
    required this.title,
    required this.onClick,
    this.height,
    this.width = double.infinity,
    this.textSize,
    this.btnColor = Colors.transparent,
    this.borderColor = AppColors.kMainColor,
    this.textColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: height ?? AppSize.h56,
      minWidth: width,
      color: btnColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: borderColor!,
        ),
      ),
      onPressed: onClick,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: textSize ?? AppSize.sp14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

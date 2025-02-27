import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';

class CustomIconWithTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onClick;
  final double? height;
  final double? width;
  final double? textSize;
  final Color? btnColor;
  final Color? textColor;

  final String  svgUrl;

  final Color ? svgColor;

  const CustomIconWithTextButton({
    required this.title,
    required this.svgUrl ,
    required this.onClick,
    this.svgColor ,
    this.height,
    this.width = double.infinity,
    this.textSize,
    this.btnColor = AppColors.kMainColor,
    this.textColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: height ?? 5.h,
      minWidth: width,
      color: btnColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: onClick,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(svgUrl ,color: svgColor ?? Colors.white) ,
            SizedBox(width: 2.w,),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: textSize ?? 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

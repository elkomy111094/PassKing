import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/constants/styles.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/resources.dart';

class LoginRegisterationheader extends StatelessWidget {
  final String cartTitle;

  const LoginRegisterationheader.LoginRegisterationHeader({
    required this.cartTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 30.h,
            width: 100.w,
            color: AppColors.kMain,
            child: Padding(
              padding: EdgeInsets.all(5.h),
              child: Center(
                child: Image.asset(
                  Resources.svgLogo,
                  height: 30.h,
                  width: 100.w,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Align(
              alignment: LanguageProvider().isArabicAppLanguage
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              child: Row(
                children: [
                  LanguageProvider().isArabicAppLanguage
                      ? SizedBox()
                      : Spacer(),
                  Container(
                    height: 6.h,
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.h),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                            child: Text(
                          cartTitle,
                          style: AppStyles.kTextStyle12.copyWith(
                              color: AppColors.kMain,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  LanguageProvider().isArabicAppLanguage
                      ? Spacer()
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

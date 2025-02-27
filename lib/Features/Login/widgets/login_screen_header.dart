import 'package:flutter/material.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/styles.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/resources.dart';

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({
    super.key,
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
            color: AppColors.kPrimaryColor,
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
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                            child: Text(
                          "LOGIN".tr,
                          style: AppStyles.kTextStyle15.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w900),
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

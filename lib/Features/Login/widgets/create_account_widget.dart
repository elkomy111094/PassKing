import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:pass_king/shared/util/ui.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/constants/styles.dart';

class CreateAccountWidget extends StatelessWidget {
  const CreateAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "If You Have Not Account ?".tr,
            style: AppStyles.kTextStyle14
                .copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
          ),
          3.pw,
          InkWell(
            onTap: () {
              UI.pushReplacement(AppRoutes.registrationScreen);
            },
            child: Container(
              height: 4.h,
              child: Center(
                child: Text(
                  "createAccount".tr,
                  style: AppStyles.kTextStyle14.copyWith(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/constants/styles.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';

class AlreadyHaveAccountButton extends StatelessWidget {
  const AlreadyHaveAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UI.pushReplacement(AppRoutes.login);
      },
      child: Container(
        width: double.infinity,
        height: 7.h,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "youAlreadyHaveAccount".tr,
              style: AppStyles.kTextStyle12
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
            ),
            3.pw,
            Text(
              "login".tr,
              style: AppStyles.kTextStyle12.copyWith(
                  color: AppColors.kBlue, fontWeight: FontWeight.normal),
            ),
          ],
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.5.h),
          color: AppColors.kLightWhite,
        ),
      ),
    );
  }
}

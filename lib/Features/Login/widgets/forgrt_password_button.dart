import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';

class ForgrtPasswordButton extends StatelessWidget {
  const ForgrtPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UI.push(AppRoutes.forgetPasswordEmailScreen);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: Text(
          "areYouForgetPassword".tr,
          style: TextStyle(
            color: AppColors.kBlue,
            fontFamily: "Taga",
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';
import '../util/ui.dart';

class SimpleHeader extends StatelessWidget {
  bool? showPopIconButton;
  String headerTitle;
  Color? headerColor;
  SimpleHeader(
      {required this.headerTitle,
      this.showPopIconButton = true,
      this.headerColor});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 9.h,
        color: headerColor ?? AppColors.kMain.withOpacity(.05),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        headerTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Taga",
                            fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
              showPopIconButton!
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: GestureDetector(
                        onTap: () {
                          UI.pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.kMain,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 5.h,
                              child: Padding(
                                padding: EdgeInsets.all(.5.h),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.kMain,
                                    size: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';
import '../resources.dart';

class MoreItemCard extends StatelessWidget {
  final String title;
  final String iconUrl;
  void Function()? onTabButton;

  MoreItemCard(
      {required this.onTabButton, required this.title, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabButton,
      child: Container(
        height: 12.h,
        width: 95.w,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.h),
              side: BorderSide(color: AppColors.kInputColor)),
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6.h,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: AppColors.kLightWhite,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.kBlackColor.withOpacity(.2))
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.h),
                        child: SizedBox(
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:iconUrl,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                color: AppColors.kLightBlue,
                              ),
                            ),
                            errorWidget: (context, url, __) =>
                                Image.asset(
                                  Resources.placeholder,
                                ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Taga",
                          fontSize: 11.sp),
                    ),
                  ],
                ),
                Container(
                  height: 5.h,
                  width: 5.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.kMain, width: 1)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.kMain,
                    size: 10.sp,
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

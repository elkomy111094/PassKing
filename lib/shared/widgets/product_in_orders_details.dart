import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import '../resources.dart';

class ProductInOrderDetailsPage extends StatelessWidget {
  const ProductInOrderDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(1.h),
          child: Row(
            children: [
              Container(
                width: 9.h,
                height: 9.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 8.h,
                        width: 8.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.kLightWhite, width: 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(1.5.h),
                              bottomLeft: Radius.circular(1.5.h),
                              bottomRight: Radius.circular(1.5.h),
                              topRight: Radius.circular(1.5.h)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1.5.h),
                          child: SizedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  "https://www.helloamsterdam.nl/app/uploads/2020/09/vurger-amsterdam-vegan-burger-restaurant.jpg",
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.kLightBlue,
                                ),
                              ),
                              errorWidget: (context, url, __) => Image.asset(
                                Resources.placeholder,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 3.h,
                        width: 3.h,
                        decoration: BoxDecoration(
                          color: AppColors.kOrangeColor,
                          border: Border.all(
                              color: AppColors.kOrangeColor, width: 1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "1X",
                            style: AppStyles.kTextStyle10.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              2.pw,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "دوبل ماك رويال",
                        style: AppStyles.kTextStyle10.copyWith(
                            color: AppColors.kBlue,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.kOrangeColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: .5.h, horizontal: 3.w),
                          child: Text(
                            "500 SR",
                            style: AppStyles.kTextStyle10.copyWith(
                              fontFamily: "Montserrat",
                              color: AppColors.kOrangeColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  1.ph,
                  Text(
                    "قطع دجاج تقدم مع بطاطس ",
                    style: AppStyles.kTextStyle10,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

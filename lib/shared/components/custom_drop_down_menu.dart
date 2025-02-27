import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:pass_king/shared/components/square_text_field.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

class ComponentsCustomDropDownMenu extends StatelessWidget {
  String title;

  final GlobalKey<ExpansionTileCardState> ddKey;

  Color titleColor;

  Color arrowsColor;

  ComponentsCustomDropDownMenu(
      {required this.title,
      required this.ddKey,
      required this.titleColor,
      required this.arrowsColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(.5)),
        borderRadius: BorderRadius.circular(2.h),
      ),
      child: Center(
        child: ExpansionTileCard(
          elevation: 0,
          borderRadius: BorderRadius.circular(2.h),
          baseColor: Colors.white,
          initialPadding: EdgeInsets.all(0),
          key: ddKey,
          trailing: Icon(Icons.keyboard_arrow_down_sharp,
              color: arrowsColor, size: 25.sp),
          title: Text(title,
              style: TextStyle(
                color: titleColor,
                fontFamily: "taga",
                fontSize: 11.sp,
              )),
          children: <Widget>[
            Divider(
              thickness: 1.0,
              height: 1.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 6.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: buildSearchTextFormField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Divider(height: 1.h),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.kLightWhite,
                                          borderRadius:
                                              BorderRadius.circular(1.h),
                                        ),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(1.h),
                                                child: Text(
                                                  "Zafran",
                                                  style: AppStyles.kTextStyle10
                                                      .copyWith(
                                                          color:
                                                              AppColors.kMain,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      5.pw,
                                      Expanded(
                                        child: Text(
                                          "مطعم زعفران الهندي",
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(.5),
                                            fontSize: 11.sp,
                                            fontFamily: "taga",
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add,
                                            color: arrowsColor,
                                          ))
                                    ],
                                  ),
                                  height: 5.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSearchTextFormField() {
    return SizedBox(
      height: 8.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SquareTextField(
          textLetterSpaceing: 0,
          preFixWidget: Icon(
            Icons.search,
            color: AppColors.kLightBlue,
          ),
          hintText: "أبحث عن متجرك المفضل",
          labelText: null,
          hintStyle: AppStyles.kTextStyle10.copyWith(color: Colors.grey),
          fillColor: Colors.transparent,
          /*controller: inst.phoneNumberController,*/
          onChanged: (phone) {},
          keyBoardType: TextInputType.text,
        ),
      ),
    );
  }
}

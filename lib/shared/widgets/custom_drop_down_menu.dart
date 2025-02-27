import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



import '../../shared/constants/colors.dart';
import '../components/square_text_field.dart';
import '../constants/styles.dart';

class WidgetsCustomDropDownMenu extends StatelessWidget {
  String title;

  final GlobalKey<ExpansionTileCardState> ddKey;

  Color titleColor;

  Color arrowsColor;

  WidgetsCustomDropDownMenu(
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
                fontFamily: "cal",
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
                child: Container(
                  width: double.infinity,
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: buildSearchTextFormField(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: Column(
                                  children: [
                                    Divider(height: .5.h),
                                    Container(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 3.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "الاتصالات",
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.5),
                                                fontSize: 11.sp,
                                                fontFamily: "cal",
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
                                      ),
                                      height: 7.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2.h),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
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
          hintStyle: AppStyles.kTextStyle10.copyWith(
              color: Colors.grey),
          fillColor: Colors.transparent,
          /*controller: inst.phoneNumberController,*/
          onChanged: (phone) {},
          keyBoardType: TextInputType.text,
        ),
      ),
    );
  }
}

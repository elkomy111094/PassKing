import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';
import '../app_size.dart';
import '../constants/styles.dart';

class CustomDropdown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final dynamic value;
  final String? hint;
  final Function(dynamic)? onChange;
  final Color? dropdownColor;

  const CustomDropdown(
      {required this.items,
      required this.value,
      required this.onChange,
      this.dropdownColor,
      this.hint,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: dropdownColor ?? AppColors.kInputColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: DropdownButton(
          hint: Text(
            hint ?? "",
            style: AppStyles.kTextStyle16.copyWith(
              color: AppColors.kGreyColor,
            ),
          ),
          value: value,
          isExpanded: true,
          underline: Container(),
          items: items,
          onChanged: onChange,
        ),
      ),
    );
  }
}

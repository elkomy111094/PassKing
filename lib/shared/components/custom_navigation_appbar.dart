import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';

import '../constants/styles.dart';
import '../util/ui.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final TextStyle? textStyle;

  const CustomAppBar({this.title, this.textStyle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => UI.pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.black,
          ),
        ),
        15.pw,
        Expanded(
          child: Text(
            title ?? "",
            style: textStyle ??
                AppStyles.kTextStyle20.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}

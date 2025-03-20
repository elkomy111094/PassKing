import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/styles.dart';
import '../resources.dart';

class NoDataWidget extends StatelessWidget {
  NoDataWidget({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Resources.noData,
              width: 30.h,
              height: 30.h,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.kTextStyle18
                  .copyWith(fontWeight: FontWeight.bold)
                  .copyWith(
                    fontWeight: FontWeight.w600,
                    height: 2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

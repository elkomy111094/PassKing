import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';

class PasswordRevealedPage extends StatefulWidget {
  const PasswordRevealedPage({super.key});

  @override
  State<PasswordRevealedPage> createState() => _PasswordRevealedPageState();
}

class _PasswordRevealedPageState extends State<PasswordRevealedPage> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, size: 20.sp),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: 2.h),
            Text("FACEBOOK",
                style: AppStyles.kTextStyle16.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "montserrat",
                  color: Colors.black,
                )),
            SizedBox(height: 2.h),
            Text("Not Compromised",
                style: AppStyles.kTextStyle16.copyWith(
                  color: Colors.green,
                  fontFamily: "montserrat",
                )),
            SizedBox(height: 1.h),
            Text("29 May 2022",
                style:
                    AppStyles.kTextStyle16.copyWith(fontFamily: "montserrat")),
            SizedBox(height: 1.h),
            Text("www.facebook.com",
                style:
                    AppStyles.kTextStyle16.copyWith(fontFamily: "montserrat")),
            SizedBox(height: 1.h),
            Text("james.smith@mail.gg",
                style:
                    AppStyles.kTextStyle16.copyWith(fontFamily: "montserrat")),
            SizedBox(height: 1.h),
            Text("ngPt_s92",
                style: AppStyles.kTextStyle16.copyWith(
                  fontFamily: "montserrat",
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.8.h),
                  ),
                  child: Text("UPDATE",
                      style: AppStyles.kTextStyle16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "montserrat",
                      )),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.8.h),
                  ),
                  child: Text("DELETE",
                      style: AppStyles.kTextStyle16.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: "montserrat",
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

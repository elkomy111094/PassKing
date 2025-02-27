import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

import '../../main.dart';
import '../components/custom_text_button.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class UI {
  static push(page, {arguments}) async {
    return await Navigator.of(navigatorKey.currentContext!)
        .pushNamed(page, arguments: arguments);
  }

  static pushReplacement(page, {arguments}) async {
    return await Navigator.of(navigatorKey.currentContext!)
        .pushReplacementNamed(page, arguments: arguments);
  }

  static void pop() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }

  static void pushWithRemove(page, {arguments}) {
    Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
      page,
      (_) => false,
      arguments: arguments,
    );
  }

  static void showPopup(message,
      {String? btnOkText,
      DialogType type = DialogType.error,
      Function? callBack}) {
    AwesomeDialog(
      context: navigatorKey.currentContext!,
      dialogType: type,
      animType: AnimType.scale,
      desc: message,
      descTextStyle: AppStyles.kTextStyle15.copyWith(
        color: AppColors.kMainColor,
      ),
      btnOk: CustomTextButton(
        text: btnOkText ?? "نعم",
        borderColor: Colors.red,
        textColor: Colors.red,
        onPressed: () => callBack != null ? callBack() : pop(),
      ),
      btnCancel: CustomTextButton(
        text: "لا",
        borderColor: Colors.green,
        textColor: Colors.green,
        onPressed: () => pop(),
      ),
    ).show();
  }

  static void showAlert(context, {message, type}) {
    Toastification().show(
      context: context,
      title: message ?? "",
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: type == MessageType.error
          ? Colors.redAccent
          : type == MessageType.success
              ? Colors.green[200]
              : type == MessageType.warning
                  ? Colors.amber
                  : Colors.green[200],
    );
  }

  static void showCustomBottomSheet(
      {required Widget child,
      required BuildContext context,
      bool? closedButton,
      double? bottomSheetHeight}) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: AppColors.kBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.h), topLeft: Radius.circular(5.h)),
        ),
        context: context,
        builder: (builder) {
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      closedButton != true
                          ? SizedBox()
                          : InkWell(
                              onTap: () {
                                UI.pop();
                              },
                              child: Container(
                                width: 5.h,
                                height: 5.h,
                                child: Padding(
                                  padding: EdgeInsets.all(1.h),
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.black,
                                    size: 15.sp,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                      closedButton != true
                          ? Spacer()
                          : SizedBox(
                              width: 25.w,
                            ),
                      Center(
                        child: Container(
                          width: 15.w,
                          height: .5.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(5.h),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Center(child: child),
                ),
              ),
            ],
          );
        });
  }
}

enum MessageType { error, success, warning }

/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';
import '../components/custom_text_button.dart';
import '../constants/styles.dart';yles.dart';

import '../generic_cubit/generic_cubit.dart';
import '../util/app_routes.dart';
import '../util/ui.dart';
import 'loading_widget.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  String from;
  OTPViewModel? otpViewModel;

  PinCodeVerificationScreen(
      {required this.phoneNumber,
      required this.from,
      this.otpViewModel});

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  bool hasError = false;
  String currentText = "";
  late String otpCode;
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: <Widget>[
          Form(
            key: widget.otpViewModel != null
                ? widget.otpViewModel!.otpFormKey
                : GlobalKey(),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                    enablePinAutofill: true,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Taga",
                    ),
                    length: 4,
                    useExternalAutoFillGroup: true,
                    obscureText: true,
                    obscuringCharacter: '*',
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    animationCurve: Curves.bounceInOut,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.kGreyColor,
                      inactiveColor: AppColors.kGreyColor,
                      selectedColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 7.h,
                      fieldWidth: 5.h,
                      activeFillColor: Colors.white,
                    ),
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                    autoFocus: true,
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: widget.otpViewModel != null
                        ? widget.otpViewModel!.otpController
                        : TextEditingController(),
                    validator: (v) {
                      if (v!.length < 4) {
                        return "يجب إدخال جميع الحقول ";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    onCompleted: (submitedCode) {
                      otpCode = submitedCode;
                      print("Completed");
                    },
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              hasError ? "يجب ملئ جميع الحقول" : "",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              enableResend
                  ? TextButton(
                      onPressed: () async
                      {
                       await  widget.otpViewModel?.resendOtpToRegister(phone:widget.phoneNumber , context: context) ;
                        setState(() {
                          enableResend = false ;
                          secondsRemaining = 60 ;
                        });
                      },
                      child: Text(
                        "resendOTPCode".tr,
                        style: AppStyles.kTextStyle12
                            .copyWith(color: AppColors.kBlue),
                      ),
                    )
                  : TextButton(
                      onPressed: null,
                      child: Text(
                        "resendOTPCode".tr,
                        style: AppStyles.kTextStyle12
                            .copyWith(color: AppColors.kGreyColor),
                      ),
                    ),
              SizedBox(
                width: 1.w,
              ),
              RichText(
                  text: TextSpan(
                      text: secondsRemaining.toString() + ":00",
                      style: AppStyles.kTextStyle12
                          .copyWith(color: AppColors.kOrangeColor))),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          BlocBuilder<GenericCubit,
              GenericCubitState>(
            bloc: widget.otpViewModel!.otpCubit,
            builder: (context, loginState) {
              return loginState is GenericLoadingState
                  ? const Loading()
                  :  Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomTextButton(
                  text: "verifyNow".tr,
                  buttonColor: AppColors.kMain,
                  roundedBorder: 10,
                  vPadding: 0,
                  hPadding: 0,
                  buttonHorizontalPaddingval: 20.w,
                  onPressed: () async {
                    if (widget.from == "registeration") {
                      await widget.otpViewModel!
                          .checkOTPCode(widget.phoneNumber);
                    } else if (widget.from == "password") {

                      await widget.otpViewModel!
                          .resendOtpToChangePassword(widget.phoneNumber);
                    }
                  },
                ),
              );
            },) ,

        ],
      ),
    );
  }
}
*/

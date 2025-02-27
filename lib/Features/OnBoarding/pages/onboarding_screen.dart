import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/custom_text_button.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';
import '../view_models/onboarding_viewModel.dart';
import '../widgets/onboarding_indecator.dart';
import '../widgets/onboarding_page_viewer.dart';
import '../widgets/onboarding_skip_button.dart';

class OnBoarding extends StatelessWidget {
  OnBoardingViewModel onBoardingViewModel = OnBoardingViewModel();
  @override
  Widget build(BuildContext context) {
    // the same function of stateless widget
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: onBoardingViewModel.onboardinCubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xffffffff),
              body: SingleChildScrollView(
                child: Column(
                  //this Stack For Containing PageView and above it the getStarted buttom
                  children: <Widget>[
                    /// PageView And Its BackGround Grey Container
                    OnboardingPageViewer(
                        onBoardingViewModel: onBoardingViewModel),
                    3.ph,

                    ///  Indicator And Bottom Button
                    OnBoardingIndecator(
                        currentIndex: onBoardingViewModel.currentIndex),
                    5.ph,

                    ///  Next / Start Now Button
                    CustomTextButton(
                        buttonColor: AppColors.kPrimaryColor,
                        buttonHorizontalPaddingval: 10.w,
                        borderColor: null,
                        textSize: 16.sp,
                        roundedBorder: 2.h,
                        onPressed: () {
                          if (onBoardingViewModel.currentIndex == 2) {
                            UI.push(AppRoutes.login);
                          } else {
                            onBoardingViewModel.changeOnBoardingCurrentPage(
                                onBoardingViewModel.currentIndex + 1);
                          }
                        },
                        text: onBoardingViewModel.currentIndex == 2
                            ? "startNow".tr
                            : "next".tr),
                    1.ph,

                    ///  Skip Button
                    onBoardingViewModel.currentIndex == 2
                        ? SizedBox()
                        : OnBoardingSkipButton(),
                  ],
                ),
              )),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants/styles.dart';
import '../view_models/onboarding_viewModel.dart';
import 'grey_bg_container.dart';

class OnboardingPageViewer extends StatelessWidget {
  const OnboardingPageViewer({
    super.key,
    required this.onBoardingViewModel,
  });

  final OnBoardingViewModel onBoardingViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      child: Stack(
        children: [
          onboardingGreyBGContainer(),
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: PageController(
                initialPage: onBoardingViewModel.currentIndex,
                keepPage: true,
                viewportFraction: 1),
            onPageChanged: (index) {
              onBoardingViewModel.changeOnBoardingCurrentPage(index);
            },
            itemBuilder: (context,
                    index) //itemBuilder will call with all items with number of index times
                {
              return Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    child: SvgPicture.asset(
                      onBoardingViewModel.onBoardingMovedItemsList[
                          onBoardingViewModel.currentIndex]["imgUrl"],
                      width: 50.w,
                      height: 30.h,
                    ),
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 17.5.h,
                  ),
                  SizedBox(
                    width: 85.w,
                    height: 10.h,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: onBoardingViewModel.onBoardingMovedItemsList[
                              onBoardingViewModel.currentIndex]["desc"],
                          style: AppStyles.kTextStyle16.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "montserrat")),
                    ),
                  ),
                ],
              );
            },
            itemCount: onBoardingViewModel.onBoardingMovedItemsList.length,
          ),
        ],
      ),
    );
  }
}

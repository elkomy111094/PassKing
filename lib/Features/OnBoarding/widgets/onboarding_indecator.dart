import 'package:flutter/material.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';

import 'indicator_individual_unit.dart';

class OnBoardingIndecator extends StatelessWidget {
  const OnBoardingIndecator({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IndicatorIndividualUnit(
          currentIndex: currentIndex,
          currentUnitIndex: 0,
        ),
        2.pw,
        IndicatorIndividualUnit(
          currentIndex: currentIndex,
          currentUnitIndex: 1,
        ),
        2.pw,
        IndicatorIndividualUnit(
          currentIndex: currentIndex,
          currentUnitIndex: 2,
        ),
      ],
    );
  }
}

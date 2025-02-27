import 'package:flutter/services.dart';

import '../../../shared/constants/strings.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/resources.dart';

class OnBoardingViewModel {
  ///Constructor
  /// Called When Creating An Object From This View Moddel
  OnBoardingViewModel() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  ///############################################################################
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  GenericCubit<dynamic> onboardinCubit = GenericCubit(null);

  final List<Map<String, dynamic>> onBoardingMovedItemsList = [
    {
      "imgUrl": Resources.onBoardingBg1,
      "desc": AppConstStrings.onBoardingPage_1_TXT,
    },
    {
      "imgUrl": Resources.onBoardingBg2,
      "desc": AppConstStrings.onBoardingPage_2_TXT,
    },
    {
      "imgUrl": Resources.onBoardingBg3,
      "desc": AppConstStrings.onBoardingPage_3_TXT
    },
  ];

  changeOnBoardingCurrentPage(int index) {
    _currentIndex = index;
    onboardinCubit.onUpdateData(null);
  }
}

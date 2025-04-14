import '../../../shared/generic_cubit/generic_cubit.dart';
import '../Utils/functions.dart';

class SplashViewModel {
  ///Constructor
  /// Called When Creating An Object From This View Moddel == initState
  SplashViewModel() {
    getSplashNextScreen();
    startLogoAnimation();
  }

  GenericCubit<dynamic> splashCubit = GenericCubit(null);
  bool logoAppearance = false;

  startLogoAnimation() async {
    Future.delayed(const Duration(seconds: 1), () {
      logoAppearance = !logoAppearance;
      splashCubit.onUpdateData(null);
    });
  }
}

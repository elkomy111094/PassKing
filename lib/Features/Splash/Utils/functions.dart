import 'package:dio/dio.dart';

import '../../../shared/models/failure.dart';
import '../../../shared/network/network.dart';
import '../../../shared/prefs/pref_manager.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';

Future getSplashNextScreen() async {
  Future<bool?> checkTokenWork() async {
    if (PrefManager.currentUser != null) {
      try {
        var dio = Dio();
        Response response = await Network.get(
          "trader/profile",
        );
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } on Failure {
        return false;
      }
    }
  }

  Future.delayed(const Duration(seconds: 5), () async {
    bool? tokenState = await checkTokenWork();
    if (await PrefManager.getOnBoardingShowState() == false) {
      UI.pushWithRemove(AppRoutes.onBoardingPage);
    } else if (PrefManager.currentUser == null) {
      UI.pushWithRemove(AppRoutes.login);
    } else {
      if (tokenState ?? false) {
        UI.pushWithRemove(AppRoutes.storeBottomNavBar);
      } else {
        UI.pushWithRemove(AppRoutes.login);
      }
    }
  });
}

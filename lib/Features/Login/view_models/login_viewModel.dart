import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/models/failure.dart';
import '../../../shared/models/user_model.dart';
import '../repositories/login_repository.dart';

class LoginViewModel {
  ///Constructor
  /// Called When Creating An Object From This View Moddel == initState
  LoginViewModel() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.kPrimaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.kPrimaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  GenericCubit<dynamic> loginCubit = GenericCubit(null);

  GlobalKey<FormState> loginFormKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String deviceToken = "";

  bool autheninticated = true;

  LoginRepository loginRepository = LoginRepository();

  login() async {
    Logger().d(deviceToken);
    print(deviceToken);
    if (loginFormKey.currentState!.validate() == false) {
      return;
    }
    loginCubit.onLoadingState();
    try {
      final data = {
        "phone": /*phoneController.text*/ "111222333",
        "password": /*passwordController.text.toString()*/ "111222333",
        "devices_token": deviceToken,
      };
      final result =
          await loginRepository.login(data: data, devicesToken: deviceToken);
      loginCubit.onUpdateData(UserModel.fromJson(result));
    } on Failure catch (failure) {
      loginCubit.onErrorState(Failure(message: failure.message));
    }
  }

  Future getUserData() async {
    try {
      await loginRepository.getUserData();
      loginCubit.onSuccessRequest(null);
    } on Failure catch (failure) {
      loginCubit.onErrorState(Failure(message: failure.message));
    }
  }
}

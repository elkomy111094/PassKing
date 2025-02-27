import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/prefs/pref_manager.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';
import '../view_models/login_viewModel.dart';
import '../widgets/create_account_widget.dart';
import '../widgets/login_form.dart';
import '../widgets/login_screen_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging firebaseMessaging =
        FirebaseMessaging.instance; // Chan// ge here
    firebaseMessaging.getToken().then((token) {
      /*Logger().d(token);*/
      loginViewModel.deviceToken = token!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: loginViewModel.loginCubit,
      listener: (context, state) {
        if (state is GenericErrorState) {
          UI.showAlert(
            context,
            message: state.responseError?.message ?? "",
            type: MessageType.error,
          );
        } else if (state is GenericUpdatedState) {
          PrefManager.setCurrentUser(state.data);
          loginViewModel.getUserData();
        } else if (state is GenericSucessRequestState) {
          if (PrefManager.currentUser!.data.activePlan) {
            UI.pushWithRemove(AppRoutes.storeBottomNavBar);
          } else {
            UI.push(AppRoutes.choosePalnScreen);
          }
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const LoginScreenHeader(),
                2.ph,
                LoginForm(loginViewModel: loginViewModel),
                4.ph,
                const CreateAccountWidget(),
                2.ph,
                Image.asset(
                  "assets/images/biometric.jpg",
                  height: 15.h,
                  width: 15.h,
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}

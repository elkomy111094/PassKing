import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:pass_king/shared/extensions/string_extensions.dart';

import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/util/ui.dart';
import '../view_models/registeration_view_model.dart';
import '../widgets/login_registeration_header.dart';
import '../widgets/phone_registeration_form.dart';

class UserPhoneRegisterationScreen extends StatelessWidget {
  RegisterationViewModel registerationViewModel = RegisterationViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: registerationViewModel.registerationCubit,
      listener: (context, state) {
        if (state is GenericErrorState) {
          UI.showAlert(
            context,
            message: state.responseError?.message ?? "",
            type: MessageType.error,
          );
        } else if (state is GenericUpdatedState) {
          /* UI.showAlert(
        context,
        message:  "رقم التحقق هو : " + registerationViewModel.otp,
        type: MessageType.success,
      );
      UI.push(AppRoutes.otpScreen,arguments:
      [ registerationViewModel.phoneController.text, "registeration" , null],);*/
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                LoginRegisterationheader.LoginRegisterationHeader(
                    cartTitle: "createAccount".tr),
                2.ph,
                PhoneRegisterationForm(
                    registerationViewModel: registerationViewModel),
              ],
            ),
          ),
        ));
      },
    );
  }
}

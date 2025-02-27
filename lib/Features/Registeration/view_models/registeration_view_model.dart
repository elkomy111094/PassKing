import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/models/failure.dart';
import '../repositories/registeration_repository.dart';

class RegisterationViewModel {
  ///Constructor
  /// Called When Creating An Object From This View Moddel == initState
  RegisterationViewModel() {
    // do when Create New Object From This ViewModel
  }
  GenericCubit<dynamic> registerationCubit = GenericCubit(null);
  GlobalKey<FormState> phoneRegisterationFormKey = GlobalKey();
  GlobalKey<FormState> completeRegisterationFormKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String otp = "";
  bool termsAndConditionsCheckState = false;
  /// terms and Conditions
  changeTermsAndConditionsState(bool newState) {
    termsAndConditionsCheckState = newState;
    registerationCubit.onUpdateData(newState);
  }

  /// Phone Registeration
  bool validatePhoneFormKey() {
    if (phoneRegisterationFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  registerPhoneToGetOTP({String? phone}) async {
    if (validatePhoneFormKey()) {
      registerationCubit.onLoadingState();
      try {
        final data = {
          "phone": phone ?? phoneController.text,
        };
        otp = await RegisterationRepository()
            .RegisterPhone(data: data)
            .then((value) {
          return value["otp"].toString();
        });
        Logger().d(otp);

        registerationCubit.onUpdateData(null);
      } on Failure catch (failure) {
        registerationCubit.onErrorState(Failure(
            message: failure.message));
      }
    }
  }

  /// Complete Registeration
  validateCompleteRegisterationFormKey() {
    if (completeRegisterationFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  completeRegisteration(
      {String? deviceToken, String? registerationtoken}) async {
    if (validateCompleteRegisterationFormKey())
    {
     if(termsAndConditionsCheckState == true)
       {
         registerationCubit.onLoadingState();
         try {
           final data = {
             "first_name": firstNameController.text.toString(),
             "last_name": lastNameController.text.toString(),
             "password": passwordController.text.toString(),
             "devices_token": deviceToken,
           };
           await RegisterationRepository()
               .completeRegisteration(data: data, token: registerationtoken!);
           registerationCubit.onSuccessRequest(null);
         } on Failure catch (failure) {
           registerationCubit.onErrorState(Failure(message:failure.message));
         }
       }
     else
       {
         registerationCubit.onErrorState(Failure(message:"يجب الموافقه علي شروط وأحكام التطبيق"));
       }
    }
  }
}

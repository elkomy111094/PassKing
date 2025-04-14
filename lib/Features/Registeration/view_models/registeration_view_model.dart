import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/models/failure.dart';
import '../repositories/registeration_repository.dart';

class RegisterationViewModel {
  /// Constructor
  /// Called When Creating An Object From This ViewModel == initState
  RegisterationViewModel() {
    // Do something when creating a new object from this ViewModel
  }

  GenericCubit<dynamic> registerationCubit = GenericCubit(null);
  GlobalKey<FormState> phoneRegisterationFormKey = GlobalKey();
  GlobalKey<FormState> completeRegisterationFormKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String otp = "";
  bool termsAndConditionsCheckState = false;

  /// Terms and Conditions
  changeTermsAndConditionsState(bool newState) {
    termsAndConditionsCheckState = newState;
    registerationCubit.onUpdateData(newState);
  }

  /// Phone Registration
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

        // Here you can call the existing API or use Firebase's Phone Authentication
        otp = await RegisterationRepository()
            .RegisterPhone(data: data)
            .then((value) {
          return value["otp"].toString();
        });

        Logger().d(otp);
        registerationCubit.onUpdateData(null);
      } on Failure catch (failure) {
        registerationCubit.onErrorState(Failure(message: failure.message));
      }
    }
  }

  /// Complete Registration
  validateCompleteRegisterationFormKey() {
    if (completeRegisterationFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> completeRegisteration(
      {String? deviceToken, String? registrationToken}) async {
    if (validateCompleteRegisterationFormKey()) {
      if (!termsAndConditionsCheckState == true) {
        registerationCubit.onLoadingState();

        try {
          // Registering the user with Firebase Authentication
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, // Using a default email
            password: passwordController.text.trim(),
          );

          Logger().d(userCredential.user!.uid);

          // Store additional user information in Firestore after successful registration
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'first_name': firstNameController.text.trim(),
            'last_name': lastNameController.text.trim(),
            'email': emailController.text,
            'uid': userCredential.user!.uid,
            'devices_token': deviceToken ?? "",
            'createdAt': Timestamp.now(),
          });

          registerationCubit.onSuccessRequest(null); // Handle success
        } on FirebaseAuthException catch (e) {
          // Handle Firebase Authentication errors
          Logger().e(e.message);
          String errorMessage = 'An error occurred, please try again later';

          // Specific error handling
          if (e.code == 'weak-password') {
            errorMessage = 'The password is too weak.';
          } else if (e.code == 'email-already-in-use') {
            errorMessage = 'The account already exists for that email.';
          }
          registerationCubit.onErrorState(
              Failure(message: errorMessage)); // Show error message
        } on Failure catch (failure) {
          // Handle custom failure errors
          registerationCubit.onErrorState(Failure(message: failure.message));
        }
      } else {
        // Handle the case where terms and conditions are not checked
        registerationCubit.onErrorState(
            Failure(message: 'You must accept the terms and conditions.'));
      }
    } else {
      // Handle the case where the form is not validated
      registerationCubit.onErrorState(
          Failure(message: 'Please fill out all fields correctly.'));
    }
  }
}

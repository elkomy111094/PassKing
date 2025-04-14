import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/models/failure.dart';
import '../../../shared/models/user_model.dart';

class LoginViewModel {
  /// Constructor
  /// Called When Creating An Object From This View Model == initState
  LoginViewModel() {
    // Set system UI overlay style
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

  // Declare necessary variables and controllers
  GenericCubit<dynamic> loginCubit = GenericCubit(null);
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String deviceToken = "";
  bool authenticated = true;

  // Login function to authenticate the user using Firebase Authentication
  Future<void> login() async {
    Logger().d(deviceToken);
    print(deviceToken);

    // Validate the form before proceeding
    if (loginFormKey.currentState?.validate() == false) {
      return;
    }

    // Show loading state while logging in
    loginCubit.onLoadingState();

    try {
      // Prepare the data for login
      String email = emailController.text.trim(); // Use email directly
      String password = passwordController.text.trim(); // Use password directly

      // Attempt to login using Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful login, fetch user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();

      if (userDoc.exists) {
        UserModel user =
            UserModel.fromJson(userDoc.data() as Map<String, dynamic>);

        loginCubit.onUpdateData(user); // Update the user data in the state
      } else {
        // Handle the case when user data is not found in Firestore
        loginCubit.onErrorState(Failure(message: 'User data not found.'));
      }
    } on FirebaseAuthException catch (e) {
      Logger().d(e.message);
      // Handle Firebase Authentication errors
      String errorMessage = 'An error occurred, please try again later';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      }
      loginCubit.onErrorState(Failure(message: errorMessage));
    } catch (e) {
      loginCubit.onErrorState(
          Failure(message: 'An unexpected error occurred. Please try again.'));
    }
  }

  // Function to get user data (if needed for other purposes)
  Future<void> getUserData() async {
    try {
      // You can call Firestore to fetch user data or do other operations
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();

        if (userDoc.exists) {
          // Update the state with the user data
          loginCubit.onUpdateData(
              UserModel.fromJson(userDoc.data() as Map<String, dynamic>));
        } else {
          loginCubit.onErrorState(Failure(message: 'User data not found.'));
        }
      } else {
        // Handle the case where no user is currently logged in
        loginCubit
            .onErrorState(Failure(message: 'No user is currently logged in.'));
      }
    } on Failure catch (failure) {
      loginCubit.onErrorState(Failure(message: failure.message));
    } catch (e) {
      // General error handling for unexpected issues
      loginCubit.onErrorState(
          Failure(message: 'Failed to retrieve user data. Please try again.'));
    }
  }
}

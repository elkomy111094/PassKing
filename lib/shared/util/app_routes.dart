import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pass_king/Features/OnBoarding/pages/onboarding_screen.dart';
import 'package:pass_king/Features/Profile/edit_profile_page.dart';
import 'package:pass_king/Features/Profile/profile_page.dart';
import 'package:pass_king/Features/Registeration/pages/complete_registeration_screen.dart';
import 'package:pass_king/Features/ResetPassword/pages/reset_password_email_screen.dart';
import 'package:pass_king/Features/change_password/change_password_page.dart';
import 'package:pass_king/Features/notifications/notification_page.dart';
import 'package:pass_king/home/home_page.dart';

import '../../Features/Login/pages/login_screen.dart';
import '../../Features/ResetPassword/pages/reset_password_screen.dart';
import '../../Features/Splash/pages/splash_screen.dart';
import '../../Features/add_new_password/add_new_password_page.dart';
import '../../Features/edit_password/edit_password_page.dart';
import '../../Features/generate_password/generate_password_page.dart';
import '../../Features/password_details/password_details_page.dart';
import '../../Features/password_reveal/password_reveal_page.dart';

class AppRoutes {
  // All app routes

  ///===========================================================================
  /// =========== splash , onboarding ,login , reset  ==========================
  static const String splashPage = "splashPage";
  static const String onBoardingPage = "onBoardingPage";
  static const String login = "login";
  static const String storeResetPasswordPhoneScreen =
      "userResetPasswordPhoneScreen";
  static const String storeBottomNavBar = "storeBottomNavBar";

  ///===========================================================================
  /// ============================ Orders ======================================
  static const String activeOrderDetails = "activeOrderDetails";

  static const String waittingOrderDetails = "waittingOrderDetails";

  static const String completedOrderDetails = "completedOrderDetails";

  ///===========================================================================
  /// ============================ Reservations  ======================================
  static const String activeReservationDetails = "activeReservationDetails";

  static const String waittingReservationDetails = "waittingReservationDetails";

  static const String completedReservationDetails =
      "completedReservationDetails";

  ///===========================================================================
  /// ============================ Store  ======================================
  static const String storeDetails = "storeDetails";

  static const String editStoreDetails = "editStoreDetails";

  ///===========================================================================
  /// ============================ Products  ======================================

  static const String productsMenu = "productsMenu";

  static const String productDetails = "productDetails";

  static const String editProductDetails = "editProductDetails";

  static const String addNewProduct = "addNewProduct";
  static const String payment = "payment";

  ///===========================================================================
  /// ============================ Branches  ======================================

  static const String branchesScreen = "branchesScreen";
  static const String forgetPasswordEmailScreen = "forgetPasswordEmailScreen";
  static const String forgetPasswordScreen = "forgetPasswordScreen";

  static const String editBranchScreen = "editBranchScreen";

  static const String homeScreen = "homeScreen";

  static const String notificationScreen = "notificationScreen";
  static const String choosePalnScreen = "choosePalnScreen";
  static const String branchLocationScreen = "branchLocationScreen";
  static const String settingsContentDetailsScreen =
      "settingsContentDetailsScreen";

  static const String registrationScreen = "registrationContentDetailsScreen";

  static const String profilePage = "profilePage";
  static const String updateProfilePage = "updateProfilePage";
  static const String changePasswordPage = "changePasswordPage";

  static const String passwordDetailsPage = "passwordDetailsPage";
  static const String passwordRevealedPage = "passwordRevealedPage";
  static const String addPasswordPage = "addPasswordPage";
  static const String generatePasswordPage = "generatePasswordPage";
  static const String editPasswordPage = "editPasswordPage";

  static PageTransition<dynamic> appRoutes(RouteSettings settings) {
    dynamic args = settings.arguments;

    switch (settings.name) {
      case splashPage:
        return appPage(SplashScreen());

      case login:
        return appPage(LoginScreen());

      case registrationScreen:
        return appPage(UserCompleteRegisterationScreen());

      case forgetPasswordEmailScreen:
        return appPage(ResetPasswordEmailScreen());

      case forgetPasswordScreen:
        return appPage(UserResetPasswordScreen(
          resetPasswordViewModel: args,
        ));

      case profilePage:
        return appPage(ProfilePage());

      case onBoardingPage:
        return appPage(OnBoarding());

      case homeScreen:
        return appPage(HomeScreen());

      case notificationScreen:
        return appPage(NotificationPage());

      case updateProfilePage:
        return appPage(EditProfilePage());

      case changePasswordPage:
        return appPage(ChangePasswordPage());

      case passwordDetailsPage:
        return appPage(PasswordDetailsPage(
          account: args,
        ));

      case passwordRevealedPage:
        return appPage(const PasswordRevealedPage());

      case addPasswordPage:
        return appPage(AddNewPasswordPage());

      case generatePasswordPage:
        return appPage(const GeneratePasswordPage());

      case editPasswordPage:
        return appPage(EditPasswordPage(
          account: args,
        ));

      default:
        return appPage(SplashScreen());
    }
  }

  static appPage(Widget page) {
    return PageTransition(
      child: page,
      type: PageTransitionType.scale,
      alignment: Alignment.center,
      duration: Duration(milliseconds: 50),
    );
    /*MaterialPageRoute(builder: (_) => page);*/
  }
}

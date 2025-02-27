import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../view_models/splash_view_model.dart';
import '../widgets/splash_animated_logo.dart';

class SplashScreen extends StatelessWidget {
  SplashViewModel splashViewModel = SplashViewModel();
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: splashViewModel.splashCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.kPrimaryColor,
            child: Center(
              child: SplashAnimatedLogo(
                  logoAppearance: splashViewModel.logoAppearance),
            ),
          ),
        );
      },
    );
  }
}

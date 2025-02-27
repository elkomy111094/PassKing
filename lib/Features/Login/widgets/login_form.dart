import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:pass_king/shared/widgets/email_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/password_form_field.dart';
import '../view_models/login_viewModel.dart';
import 'forgrt_password_button.dart';
import 'login_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.loginViewModel,
  });

  final LoginViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Form(
        key: loginViewModel.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.ph,

            /// Phone FormField
            EmailFormField(controller: TextEditingController()),
            2.ph,

            /// password FormField
            PasswordFormField(controller: loginViewModel.passwordController),

            /// Forget Password Button
            ForgrtPasswordButton(),

            /// Enter Button
            BlocBuilder<GenericCubit, GenericCubitState>(
              bloc: loginViewModel.loginCubit,
              builder: (context, loginState) {
                return loginState is GenericLoadingState
                    ? const Loading()
                    : LoginButton(onPressed: () async {
                        await loginViewModel.login();
                      });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/Features/add_new_password/view_models/add_password_view_model.dart';
import 'package:pass_king/shared/generic_cubit/generic_cubit.dart';
import 'package:pass_king/shared/models/password_model.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:pass_king/shared/util/ui.dart';
import 'package:pass_king/shared/widgets/loading_widget.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';

class PasswordDetailsPage extends StatefulWidget {
  PasswordDetailsPage({super.key, required this.account});
  AccountModel account;

  @override
  State<PasswordDetailsPage> createState() => _PasswordDetailsPageState();
}

class _PasswordDetailsPageState extends State<PasswordDetailsPage>
    with SingleTickerProviderStateMixin {
  bool isPasswordVisible = false;

  final bool isCompromised = false;

  AddPasswordViewModel viewModel = AddPasswordViewModel();

  late AnimationController _animationController;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _opacityAnim =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
      isPasswordVisible
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  void copyPassword() {
    Clipboard.setData(ClipboardData(text: widget.account.password));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Password copied to clipboard"),
        backgroundColor: Colors.black87,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: viewModel.addPasswordCubit,
      listener: (context, state) {
        if (state is GenericErrorState) {
          UI.showAlert(
            context,
            message: state.responseError?.message ?? "",
            type: MessageType.error,
          );
        } else if (state is GenericUpdatedState) {
          UI.pushWithRemove(AppRoutes.homeScreen);
          UI.showAlert(
            context,
            message: "Password Deleted successfully!",
            type: MessageType.success,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // AppBar with Title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: EdgeInsets.all(1.5.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: Icon(Icons.arrow_back_ios_new, size: 18.sp),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "PASSWORD DETAILS",
                        style: AppStyles.kTextStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Website Icon / Avatar
                        Center(
                          child: CircleAvatar(
                            radius: 30.sp,
                            backgroundColor: Colors.grey.shade100,
                            child: Text(
                              widget.account.name.trim().isNotEmpty
                                  ? widget.account.name.trim()[0]
                                  : '',
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),

                        Center(
                          child: Text(
                            widget.account.name.toUpperCase(),
                            style: AppStyles.kTextStyle18.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Center(
                          child: Text(
                            isCompromised ? "COMPROMISED" : "NOT COMPROMISED",
                            style: AppStyles.kTextStyle16.copyWith(
                              color: isCompromised ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),

                        infoRow(Icons.calendar_today, "Created on",
                            widget.account.createdAt.toString()),
                        infoRow(Icons.link, "Website", widget.account.link),
                        infoRow(Icons.email, "Email", widget.account.email),
                        infoRow(
                          Icons.lock,
                          "Password",
                          isPasswordVisible
                              ? widget.account.password
                              : "********",
                          trailing: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.red,
                            ),
                            onPressed: togglePasswordVisibility,
                          ),
                        ),
                        if (isPasswordVisible)
                          FadeTransition(
                            opacity: _opacityAnim,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton.icon(
                                onPressed: copyPassword,
                                icon: Icon(Icons.copy, color: Colors.red),
                                label: Text(
                                  "COPY PASSWORD",
                                  style: AppStyles.kTextStyle16.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // Action Buttons
                Padding(
                  padding: EdgeInsets.only(
                      left: 5.w, right: 5.w, bottom: 2.5.h, top: 1.h),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 6.5.h,
                        child: ElevatedButton(
                          onPressed: () => UI.push(AppRoutes.editPasswordPage,
                              arguments: widget.account),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            "UPDATE",
                            style: AppStyles.kTextStyle16.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      SizedBox(
                        width: double.infinity,
                        height: 6.5.h,
                        child: state is GenericLoadingState
                            ? Loading()
                            : OutlinedButton(
                                onPressed: () async {
                                  await viewModel.deletePassword(
                                      documentId: widget.account.id);
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Text(
                                  "DELETE",
                                  style: AppStyles.kTextStyle16.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget infoRow(IconData icon, String label, String value,
      {Widget? trailing}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.3.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppStyles.kTextStyle16.copyWith(
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  value,
                  style: AppStyles.kTextStyle16.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}

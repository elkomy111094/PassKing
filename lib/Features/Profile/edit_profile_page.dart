import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_king/Features/Profile/update_pofile_view_model.dart';
import 'package:pass_king/shared/generic_cubit/generic_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart';
import '../../shared/prefs/pref_manager.dart';
import '../../shared/util/app_routes.dart';
import '../../shared/util/ui.dart';
import '../../shared/widgets/loading_widget.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final TextEditingController _nameController =
      TextEditingController(text: "John Doe");
  UpdateUserProfileViewModel viewModel = UpdateUserProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: viewModel.updateProfileCubit,
      listener: (context, state) {
        if (state is GenericErrorState) {
          UI.showAlert(
            context,
            message: state.responseError?.message ?? "",
            type: MessageType.error,
          );
        } else if (state is GenericUpdatedState) {
          PrefManager.setCurrentUser(state.data).then((value) {
            UI.pushWithRemove(AppRoutes.homeScreen);
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white, // Light background
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 3.h),

                  /// SAME HEADER AS PROFILE PAGE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios,
                            color: Colors.black, size: 18.sp),
                      ),
                      Text(
                        "EDIT PROFILE",
                        style: AppStyles.kTextStyle18.copyWith(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 18.sp), // Spacer to balance row
                    ],
                  ),

                  SizedBox(height: 4.h),

                  // Profile Image
                  Container(
                    width: 25.w,
                    height: 25.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: FileImage(
                            viewModel.selectedImage ?? File(""),
                          ),
                          fit: BoxFit.cover),
                      border: Border.all(color: Colors.red, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: viewModel.selectedImage != null
                          ? SizedBox()
                          : Icon(Icons.person, size: 40, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 2.h),

                  GestureDetector(
                    onTap: viewModel.pickImage,
                    child: Text(
                      "Change Picture",
                      style: AppStyles.kTextStyle14.copyWith(
                        fontSize: 12.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  /// Name Label
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "NAME",
                      style: AppStyles.kTextStyle14.copyWith(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 1.h),

                  /// Name Input
                  TextFormField(
                    controller: viewModel.nameController,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "John Doe",
                      hintStyle:
                          TextStyle(fontSize: 12.5.sp, color: Colors.grey[500]),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 4.w, vertical: 1.8.h),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),

                  SizedBox(height: 5.h),

                  /// Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 6.5.h,
                    child: state is GenericLoadingState
                        ? Loading()
                        : ElevatedButton(
                            onPressed: () {
                              viewModel.updateUserData();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 8,
                              shadowColor: Colors.redAccent,
                            ),
                            child: Text(
                              "SAVE",
                              style: AppStyles.kTextStyle14.copyWith(
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),

                  SizedBox(height: 2.h),

                  /// Cancel Button
                  SizedBox(
                    width: double.infinity,
                    height: 6.5.h,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        "CANCEL",
                        style: AppStyles.kTextStyle14.copyWith(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

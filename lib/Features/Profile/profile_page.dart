import 'package:flutter/material.dart';
import 'package:pass_king/shared/prefs/pref_manager.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:pass_king/shared/util/ui.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/styles.dart' show AppStyles;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.h),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios,
                      color: Colors.black87, size: 22.sp),
                  Text(
                    "PROFILE",
                    style: AppStyles.kTextStyle18.copyWith(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 22.sp), // Placeholder to balance row
                ],
              ),

              SizedBox(height: 5.h),

              // Profile Image
              Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.25),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.person, size: 50, color: Colors.black87),
                ),
              ),

              SizedBox(height: 3.h),

              // Name & Email
              Text(
                PrefManager.currentUser!.firstName +
                    " " +
                    PrefManager.currentUser!.lastName,
                style: AppStyles.kTextStyle14.copyWith(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                PrefManager.currentUser!.email,
                style: AppStyles.kTextStyle11.copyWith(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(height: 5.h),

              // Action Buttons
              buildActionButton(
                context,
                icon: Icons.edit,
                title: "Update Profile",
                onTap: () => UI.push(AppRoutes.updateProfilePage),
              ),
              buildActionButton(
                context,
                icon: Icons.lock,
                title: "Change Master Password",
                onTap: () => UI.push(AppRoutes.changePasswordPage),
              ),
/*              buildActionButton(
                context,
                icon: Icons.edit_note_rounded,
                title: "Autofill Settings",
                onTap: () {},
              ),
              buildActionButton(
                context,
                icon: Icons.nightlight_round,
                title: "Switch to Dark Mode",
                onTap: () {},
              ),*/

              SizedBox(height: 2.h),

              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 7.h,
                child: ElevatedButton(
                  onPressed: () {
                    UI.pushWithRemove(AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 12,
                    shadowColor: Colors.redAccent,
                  ),
                  child: Text(
                    "Logout",
                    style: AppStyles.kTextStyle13.copyWith(
                      color: Colors.white,
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 2.h),

              // Version Text
              /*     Text(
                "v 0.1.2",
                style: AppStyles.kTextStyle18.copyWith(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                ),
              ),*/
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.5.h),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.redAccent, size: 22.sp),
        title: Text(
          title,
          style: AppStyles.kTextStyle12.copyWith(
            color: Colors.black,
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing:
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey[600]),
      ),
    );
  }
}

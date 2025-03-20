import 'package:flutter/material.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:pass_king/shared/constants/styles.dart';
import 'package:sizer/sizer.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Password Added',
      'message': 'You added a new password for Facebook.',
      'time': '5 mins ago',
      'icon': Icons.lock
    },
    {
      'title': 'Security Alert',
      'message': 'Unusual login attempt detected.',
      'time': '2 hours ago',
      'icon': Icons.warning_amber
    },
    {
      'title': 'Backup Completed',
      'message': 'Your password backup was completed successfully.',
      'time': 'Yesterday',
      'icon': Icons.cloud_done
    },
    {
      'title': 'Password Expiring Soon',
      'message': 'Your Amazon password will expire in 3 days.',
      'time': '2 days ago',
      'icon': Icons.timer
    },
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Notifications",
          style: AppStyles.kTextStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (_, __) => SizedBox(height: 2.h),
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(3.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(3.w),
                    ),
                    child: Icon(
                      item['icon'],
                      color: AppColors.kPrimaryColor,
                      size: 6.w,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  // Texts
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: AppStyles.kTextStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item['time'],
                          style: AppStyles.kTextStyle16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.kGreyColor),
                        ),
                        Divider(),
                        Text(
                          item['message'],
                          style: AppStyles.kTextStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

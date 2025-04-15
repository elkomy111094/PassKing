import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pass_king/shared/constants/colors.dart';
import 'package:pass_king/shared/constants/styles.dart';
import 'package:pass_king/shared/extensions/padding_extentions.dart';
import 'package:pass_king/shared/generic_cubit/generic_cubit.dart';
import 'package:pass_king/shared/prefs/pref_manager.dart';
import 'package:pass_king/shared/util/app_routes.dart';
import 'package:pass_king/shared/util/ui.dart';
import 'package:pass_king/shared/widgets/loading_widget.dart';
import 'package:pass_king/shared/widgets/no_data_widget.dart';
import 'package:sizer/sizer.dart';

import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();
  @override
  void initState() {
    viewModel.getAllPasswords();
  }

  void copyPassword(String password) {
    Fluttertoast.showToast(
      msg: "Password copied: $password",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit, GenericCubitState>(
      bloc: viewModel.homeCubit,
      listener: (context, state) {
        if (state is GenericErrorState) {
          UI.showAlert(
            context,
            message: state.responseError?.message ?? "",
            type: MessageType.error,
          );
        } else if (state is GenericUpdatedState) {}
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              CustomHeader(
                userName: PrefManager.currentUser?.firstName ?? "",
                profileImageUrl: 'https://i.pravatar.cc/150?img=3',
                notificationCount: 5,
                onProfileTap: () => UI.push(AppRoutes.profilePage),
                onNotificationTap: () => UI.push(AppRoutes.notificationScreen),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      3.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoCard(
                            number: viewModel.accountsList == null
                                ? 0
                                : viewModel.accountsList!.length,
                            label: 'Passwords \n Stored',
                            onTap: () {
                              // Handle tap here
                            },
                          ),
                          InfoCard(
                            number: 5,
                            label: 'Passwords Compromised',
                            onTap: () {
                              // Handle tap here
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: viewModel.searchController,
                        onChanged: (value) {
                          // استدعاء دالة البحث عند تغيير النص
                          viewModel.searchPasswords(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Search Websites...",
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          // تحقق اختياري لو حبيت تضيفه
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: state is GenericLoadingState
                            ? Loading()
                            : state is GenericErrorState
                                ? Center(
                                    child: Text(
                                        state.responseError?.message ?? ""))
                                : viewModel.accountsList == null ||
                                        viewModel.accountsList!.isEmpty
                                    ? NoDataWidget(title: "No Passwords Found")
                                    : ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount:
                                            viewModel.accountsList!.length,
                                        itemBuilder: (context, index) {
                                          final item =
                                              viewModel.accountsList![index];
                                          return Container(
                                            height: 11.h,
                                            child: Card(
                                              color: Colors.white,
                                              elevation: 0,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.h),
                                                  side: BorderSide(
                                                      color: AppColors
                                                          .kGreyColor
                                                          .withOpacity(.5))),
                                              child: Center(
                                                child: ListTile(
                                                  onTap: () {
                                                    UI.push(
                                                        AppRoutes
                                                            .passwordDetailsPage,
                                                        arguments: item);
                                                  },
                                                  leading: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey[800],
                                                    child: Text(
                                                      item.name
                                                              .trim()
                                                              .isNotEmpty
                                                          ? item.name.trim()[0]
                                                          : '',
                                                      style: AppStyles
                                                          .kTextStyle18
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                  title: Text(
                                                    item.name,
                                                    style: AppStyles
                                                        .kTextStyle18
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  trailing: IconButton(
                                                    icon: const Icon(Icons.copy,
                                                        color: Colors.red),
                                                    onPressed: () =>
                                                        copyPassword(
                                                            item.password),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.kPrimaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              UI.push(AppRoutes.addPasswordPage);
            },
            child: const Icon(Icons.add, size: 30, color: Colors.white),
          ),
        );
      },
    );
  }
}

class InfoCard extends StatefulWidget {
  final int number;
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  const InfoCard({
    super.key,
    required this.number,
    required this.label,
    this.icon,
    this.onTap,
  });

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(4.w),
          splashColor: Colors.redAccent.withOpacity(0.3),
          highlightColor: Colors.redAccent.withOpacity(0.1),
          child: Container(
            width: 42.w,
            height: 22.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              color: Color(0xfff9f9f9),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null)
                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 8.w,
                  ),
                TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: widget.number),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, _) => Text(
                    "$value",
                    style: AppStyles.kTextStyle20.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
                5.ph,
                Text(
                  widget.label,
                  style: AppStyles.kTextStyle16.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  final String userName;
  final String profileImageUrl;
  final int notificationCount;
  final VoidCallback onProfileTap;
  final VoidCallback onNotificationTap;

  const CustomHeader({
    super.key,
    required this.userName,
    required this.profileImageUrl,
    required this.notificationCount,
    required this.onProfileTap,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: double.infinity,
      height: 20.h, // Header height
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF450113), Color(0xFF970306)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5.w),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Image
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  profileImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.person,
                    size: 7.w,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),

          // Welcome Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome back,',
                style: AppStyles.kTextStyle20.copyWith(
                  fontSize: 20.sp,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                '$userName 👋',
                style: AppStyles.kTextStyle20.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),

          // Notification Icon with Badge
          Container(
            height: 7.h,
            width: 7.h,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: onNotificationTap,
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      size: 7.w,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
                if (notificationCount > 0)
                  Positioned(
                    top: 0.w,
                    right: 0.w,
                    child: Container(
                      height: 3.h,
                      width: 3.h,
                      padding: EdgeInsets.all(0.5.w),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 0.5.w),
                      ),
                      child: Center(
                        child: Text(
                          '${notificationCount > 9 ? '9+' : notificationCount}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

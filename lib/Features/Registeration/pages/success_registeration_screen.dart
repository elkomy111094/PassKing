import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:sizer/sizer.dart';



import '../../../shared/constants/styles.dart';
import '../../../shared/resources.dart';
import '../../../shared/util/app_routes.dart';
import '../../../shared/util/ui.dart';

class SuccessRegisterationScreen extends StatefulWidget {
  const SuccessRegisterationScreen({Key? key}) : super(key: key);

  @override
  State<SuccessRegisterationScreen> createState() =>
      _SuccessRegisterationScreenState();
}

class _SuccessRegisterationScreenState
    extends State<SuccessRegisterationScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        UI.pushWithRemove(AppRoutes.login) ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SuccessRegisterationLogo(),
                SuccessRegisterationTXT(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessRegisterationTXT extends StatelessWidget {
  const SuccessRegisterationTXT({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "تم تسجيل دخولك بنجاح",
      style: AppStyles.kTextStyle15.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class SuccessRegisterationLogo extends StatelessWidget {
  const SuccessRegisterationLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      child:
          Center(child: SvgPicture.asset(Resources.successSvg)),
    );
  }
}

import 'package:flutter/material.dart';

import '../app_size.dart';
import '../resources.dart';



class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.screenHeight*(.11),
      child: Center(
        child: SizedBox(
            width: AppSize.h150,
            height: AppSize.h150,
            child: Image.asset(Resources.appLogo)),
      ),
    );
  }
}
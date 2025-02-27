import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class CustomVerticalDivider extends StatelessWidget {

  final double height ;
  final double width ;
  final Color dividerColor ;

  const CustomVerticalDivider({
    super.key,
    required this.width ,
    required this.height ,
    required this.dividerColor ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height:height,width: width,color: dividerColor,);
  }
}
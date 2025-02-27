import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../resources.dart';

class ClippedCachedNetworkImage extends StatelessWidget {
  ClippedCachedNetworkImage({
    super.key,
    required this.width   ,
    required this.height  ,
    required this.imgUrl  ,
    required this.borderColor ,
    required this.radius ,
  });

  double width  ;
  double height ;
  String imgUrl ;
  Color borderColor ;
  double radius ;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
            color: borderColor ?? AppColors.kGreyColor, width: 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
            topRight: Radius.circular(radius)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl:
            imgUrl,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: AppColors.kLightBlue,
              ),
            ),
            errorWidget: (context, url, __) =>
                Image.asset(
                  Resources.placeholder,
                ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/image/images.dart';

import '../../../res/value/dimenssion/dimenssions.dart';


class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage(
      {super.key, this.height, this.width, this.fit, this.image, this.color});
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image ?? logo,
      fit: fit ?? BoxFit.fill,
      color: color,
      height: height == null ? screenHeight / 4 : height!.h,
      width: width == null ? screenWidth : width!.w,
    );
  }
}

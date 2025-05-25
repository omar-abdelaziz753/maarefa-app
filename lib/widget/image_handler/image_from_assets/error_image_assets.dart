import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/image/images.dart';
import '../../../res/value/dimenssion/dimenssions.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key, this.width, this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logo,
      fit: BoxFit.fill,
      height: height == null ? screenHeight / 4 : height!.h,
      width: width == null ? screenWidth : width!.w,
    );
  }
}

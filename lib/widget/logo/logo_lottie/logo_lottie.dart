import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/image/images.dart';

class LogoLottie extends StatelessWidget {
  final double logoHeight;
  final double logoWidth;
  const LogoLottie({
    super.key,
    required this.logoHeight,
    required this.logoWidth,
  });
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logo,
      height: logoHeight.h,
      width: logoWidth.w,
      fit: BoxFit.contain,
    );
  }
}

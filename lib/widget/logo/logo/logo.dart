import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/image/images.dart';

class Logo extends StatelessWidget {
  final double logoHeight;
  final double logoWidth;
  final Color? logoColor;
  const Logo(
      {super.key, this.logoHeight = 50, this.logoWidth = 50, this.logoColor});
  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(logo2),
      color: logoColor,
      height: logoHeight.h,
      width: logoWidth.w,
      fit: BoxFit.contain,
    );
  }
}

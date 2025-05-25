import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/value/color/color.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;
  const SocialButton({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 65.w,
        height: 70.h,
        decoration: BoxDecoration(
          border: Border.all(color: textfieldColor),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Image.asset(image, height: 45.h, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

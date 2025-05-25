import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/icon/icons.dart';
import '../../../res/value/color/color.dart';

class RoleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const RoleButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 80.h,
        width: 80.w,
        decoration: const BoxDecoration(
          color: mainColor,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Image.asset(arrow,
                color: white, width: 60.w, fit: BoxFit.contain)),
      ),
    );
  }
}

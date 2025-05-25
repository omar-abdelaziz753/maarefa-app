import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/value/color/color.dart';
import '../../side_padding/side_padding.dart';

class MasterBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const MasterBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 20,
      child: InkWell(
        onTap: onPressed ?? () => Get.back(),
        child: Container(
          height: 40.h,
          width: 40.w,
          decoration: const BoxDecoration(
            color: white,
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Icon(CupertinoIcons.back, color: black, size: 25.h)),
        ),
      ),
    );
  }
}

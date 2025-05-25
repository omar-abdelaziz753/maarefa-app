import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';

// ignore: non_constant_identifier_names
ShareAppBar({
  required String title,
  Color? backgroundColor,
  VoidCallback? backPressed,
  VoidCallback? sharePressed,
  bool? centerTitle,
  bool? isBack,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? transparent,
    elevation: 0.0,
    centerTitle: centerTitle ?? true,
    title:
        Text(title, style: TextStyles.appBarStyle.copyWith(color: mainColor)),
    leading: isBack == false
        ? const SizedBox()
        : IconButton(
            onPressed: backPressed ?? () => Get.back(),
            icon: Icon(CupertinoIcons.back, color: mainColor, size: 25.h),
          ),
    actions: [
      IconButton(
          icon: const Icon(
            CupertinoIcons.arrowshape_turn_up_left_fill,
            color: mainColor,
          ),
          onPressed: sharePressed),
    ],
  );
}

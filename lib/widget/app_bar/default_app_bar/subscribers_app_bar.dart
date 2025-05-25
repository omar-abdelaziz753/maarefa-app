import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';

// ignore: non_constant_identifier_names
SubscribersAppBar(
    {required String title,
    required String title2,
    Color? backgroundColor,
    VoidCallback? backPressed}) {
  return AppBar(
    backgroundColor: backgroundColor ?? transparent,
    elevation: 0.0,
    centerTitle: false,
    title: Text(title, style: TextStyles.appBarStyle),
    leading: IconButton(
      onPressed: backPressed ?? () => Get.back(),
      icon: Icon(CupertinoIcons.back, color: secColor, size: 25.h),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        child: Text(
          title2,
          style: TextStyles.hintStyle.copyWith(color: grey),
        ),
      ),
    ],
  );
}

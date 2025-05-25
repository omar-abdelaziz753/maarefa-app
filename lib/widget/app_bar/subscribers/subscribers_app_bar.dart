import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';

// ignore: non_constant_identifier_names
SubscribersAppBar(
    {required String title,
    required String subTitle,
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
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
        child: Text(
          subTitle,
          style: TextStyles.hintStyle.copyWith(color: grey),
        ),
      ),
    ],
  );
}

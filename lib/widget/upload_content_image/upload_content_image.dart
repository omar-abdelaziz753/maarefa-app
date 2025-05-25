import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';

import '../../res/value/dimenssion/dimenssions.dart';
import '../../res/value/style/textstyles.dart';

class UploadContentImage extends StatelessWidget {
  final VoidCallback? onTap;
  final File? image;
  final bool isPicked;
  final String? title;
  const UploadContentImage(
      {super.key, this.onTap, this.image, this.title, this.isPicked = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isPicked == false
                  ? Image.asset(
                      gallery,
                      width: 85.w,
                      height: 85.h,
                      fit: BoxFit.contain,
                    )
                  : Image.file(image!,
                      width: 85.w, height: 85.h, fit: BoxFit.contain),
              Text(
                title ?? tr("upload_course_image"),
                style: TextStyles.textView17Bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadAdsImage extends StatelessWidget {
  final VoidCallback? onTap;
  final File? image;
  final bool isPicked;
  const UploadAdsImage(
      {super.key, this.onTap, this.image, this.isPicked = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isPicked == false
                  ? Image.asset(
                      gallery,
                      width: 85.w,
                      height: 85.h,
                      fit: BoxFit.contain,
                    )
                  : Image.file(image!,
                      width: 85.w, height: 85.h, fit: BoxFit.contain),
              Text(
                tr("ads_image"),
                style: TextStyles.textView17Bold,
              ),
              Text(
                tr("ads_image_content"),
                style: TextStyles.textView14SemiBold.copyWith(color: grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

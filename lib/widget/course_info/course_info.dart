import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/drawable/image/images.dart';
import '../../res/value/color/color.dart';
import '../../res/value/style/textstyles.dart';
import '../side_padding/side_padding.dart';

class CourseInfo extends StatelessWidget {
  final dynamic courseModel;
  final dynamic bookmarkCoursesModel;
  final String? rate;
  final String? rater;
  final String? speciality;

  const CourseInfo(
      {super.key,
      this.courseModel,
      this.bookmarkCoursesModel,
      this.rate,
      this.rater,
      this.speciality});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 10,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 150.w,
                  child: Text(
                    courseModel == null
                        ? bookmarkCoursesModel!.name
                        : courseModel.name!,
                    style: TextStyles.unselectedStyle.copyWith(
                        color: secColor,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                const Spacer(),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    courseModel == null
                        ? bookmarkCoursesModel!.price!
                        : courseModel!.price!,
                    style:
                        TextStyles.loginTitleStyle.copyWith(color: blackColor),
                  ),
                ),
                Text(
                  tr("sar"),
                  style: TextStyles.hintStyle.copyWith(color: black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  star,
                  height: 15.h,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),
                Text(
                  rate!,
                  style: TextStyles.subTitleStyle
                      .copyWith(color: secColor, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 5),
                Text(
                  rater!,
                  style: TextStyles.smallStyle,
                ),
              ],
            ),
            Text(
              speciality!,
              style: TextStyles.hintStyle,
            ),
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/value/color/color.dart';

import '../../../res/value/style/textstyles.dart';

class DateCard extends StatelessWidget {
  final String date, time;
  final VoidCallback? onTap;
  const DateCard({super.key, required this.date, required this.time, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: dateGradient,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(date, style: TextStyles.errorStyle.copyWith(color: white)),
                Text(time, style: TextStyles.errorStyle.copyWith(color: white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

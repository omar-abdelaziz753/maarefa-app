import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/value/color/color.dart';
import '../../res/value/dimenssion/dimenssions.dart';
import '../../res/value/style/textstyles.dart';
import '../side_padding/side_padding.dart';

class CourseType extends StatelessWidget {
  final int? groupValue;
  final String title, firstChoice, secondChoice;
  final VoidCallback Function(int?)? onChangedFirst;
  final VoidCallback Function(int?)? onChangedSecond;
  const CourseType(
      {super.key,
      this.groupValue,
      this.onChangedFirst,
      this.onChangedSecond,
      required this.title,
      required this.firstChoice,
      required this.secondChoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 65.h,
      decoration: BoxDecoration(
        border: Border.all(color: textfieldColor),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: SidePadding(
        sidePadding: 10,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyles.appBarStyle.copyWith(color: mainColor),
            ),
            Radio(value: 1, groupValue: groupValue, onChanged: onChangedFirst),
            Text(
              firstChoice,
              style: groupValue == 1
                  ? TextStyles.textView14SemiBold
                      .copyWith(color: sufixtextColor)
                  : TextStyles.hintStyle,
            ),
            Radio(value: 2, groupValue: groupValue, onChanged: onChangedSecond),
            Text(
              secondChoice,
              style: groupValue == 2
                  ? TextStyles.textView14SemiBold
                      .copyWith(color: sufixtextColor)
                  : TextStyles.hintStyle,
            ),
          ],
        ),
      ),
    );
  }
}

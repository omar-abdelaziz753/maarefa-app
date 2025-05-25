import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/icon/icons.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/space/space.dart';

class AdviceDetailsCard extends StatelessWidget {
  const AdviceDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr("legal_advice"),
          style: TextStyles.appBarStyle.copyWith(color: black),
        ),
        Text(
          tr("legal"),
          style: TextStyles.errorStyle.copyWith(color: mainColor),
        ),
        Row(
          children: [
            Image.asset(
              profile,
              height: 17.h,
              fit: BoxFit.contain,
              color: textfieldColor,
            ),
            const Space(
              boxWidth: 15,
            ),
            Text(
              "أ/ عادل السيد",
              style: TextStyles.hintStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Space(
          boxHeight: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("hourly_price"),
              style: TextStyles.hintStyle,
            ),
            Row(
              children: [
                Text(
                  "80",
                  style: TextStyles.hintStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Space(
                  boxWidth: 10,
                ),
                Text(
                  tr("sar"),
                  style: TextStyles.hintStyle,
                ),
              ],
            ),
          ],
        ),
        const Space(
          boxHeight: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("course_hours"),
              style: TextStyles.hintStyle.copyWith(color: mainColor),
            ),
            Row(
              children: [
                Text(
                  "10",
                  style: TextStyles.hintStyle
                      .copyWith(color: mainColor, fontWeight: FontWeight.bold),
                ),
                const Space(
                  boxWidth: 10,
                ),
                Text(
                  tr("hour"),
                  style: TextStyles.hintStyle.copyWith(color: mainColor),
                ),
              ],
            ),
          ],
        ),
        const Space(
          boxHeight: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("total"),
              style: TextStyles.appBarStyle.copyWith(color: secColor),
            ),
            Row(
              children: [
                Text(
                  "220",
                  style: TextStyles.hintStyle.copyWith(
                      color: secColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Space(
                  boxWidth: 10,
                ),
                Text(
                  tr("sar"),
                  style: TextStyles.hintStyle.copyWith(color: secColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

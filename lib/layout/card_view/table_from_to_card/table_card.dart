import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/user/groups_courses/groups_courses_model.dart';
import '../../../res/drawable/image/images.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/space/space.dart';

class TableCard extends StatelessWidget {
  const TableCard({super.key, required this.data});
  final GroupModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: profileColor,
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 40.h,
            color: discountCardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr("start_from"),
                  style: TextStyles.hintStyle,
                ),
                const Space(
                  boxWidth: 5,
                ),
                Text(
                  DateFormat("yyyy-MM-dd")
                      .format(DateTime.parse(data.startFrom.toString())),
                  style: TextStyles.hintStyle.copyWith(color: black),
                ),
                const Space(
                  boxWidth: 20,
                ),
                Text(
                  tr("for"),
                  style: TextStyles.hintStyle,
                ),
                const Space(
                  boxWidth: 5,
                ),
                Text(
                  "${data.duration?.number} ${data.duration?.type}",
                  style: TextStyles.hintStyle.copyWith(color: black),
                ),
              ],
            ),
          ),
          Container(
            height: 40.h,
            color: discountCardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr("from"),
                  style: TextStyles.hintStyle,
                ),
                const Space(
                  boxWidth: 5,
                ),
                Text(
                  data.start!.time.toString(),
                  style: TextStyles.hintStyle.copyWith(color: black),
                ),
                const Space(
                  boxWidth: 20,
                ),
                Text(
                  tr("to"),
                  style: TextStyles.hintStyle,
                ),
                const Space(
                  boxWidth: 5,
                ),
                Text(
                  data.end!.time,
                  style: TextStyles.hintStyle.copyWith(color: black),
                ),
              ],
            ),
          ),
          const Space(
            boxHeight: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data.start!.dayOfWeek,
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                    const Space(
                      boxHeight: 5,
                    ),
                    Text(
                      DateFormat("yyyy-MM-dd")
                          .format(DateTime.parse(data.start!.date.toString())),
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Image.asset(lineImage),
                    Text(
                      data.start!.times.map((e) => e).toString(),
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data.end!.dayOfWeek,
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                    const Space(
                      boxHeight: 5,
                    ),
                    Text(
                      DateFormat("yyyy-MM-dd")
                          .format(DateTime.parse(data.end!.date.toString())),
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

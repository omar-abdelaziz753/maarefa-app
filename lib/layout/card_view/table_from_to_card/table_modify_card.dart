import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/image/images.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/buttons/master/master_button.dart';
import '../../../widget/space/space.dart';

class TableModifyCard extends StatelessWidget {
  const TableModifyCard({super.key});

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
            color: profileColor,
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
                  "22/1/2022",
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
                  "شهر",
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
                      "السبت",
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                    const Space(
                      boxHeight: 5,
                    ),
                    Text(
                      "22/1/2022",
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
                      "كل سبت و تلات و خميس",
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "السبت",
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                    const Space(
                      boxHeight: 5,
                    ),
                    Text(
                      "22/1/2022",
                      style: TextStyles.hintStyle.copyWith(color: mainColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Space(
            boxHeight: 20,
          ),
          MasterButton(
              onPressed: () {},
              sidePadding: 10,
              buttonColor: profileColor,
              borderColor: profileColor,
              buttonStyle:
                  TextStyles.hintStyle.copyWith(color: mainColor, fontSize: 16),
              buttonText: tr("modify")),
        ],
      ),
    );
  }
}

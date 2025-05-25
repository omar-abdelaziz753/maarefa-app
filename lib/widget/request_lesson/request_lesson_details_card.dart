import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/icon/icons.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/space/space.dart';

class RequestLessonDetailsCard extends StatelessWidget {
  final dynamic lessonDetails;

  const RequestLessonDetailsCard({
    super.key,
    this.lessonDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lessonDetails?.subject?.name ?? '',
          style: TextStyles.appBarStyle
              .copyWith(color: blackColor, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("subject"),
              style: TextStyles.errorStyle.copyWith(color: mainColor),
            ),
            Text(
              tr("live"),
              style: TextStyles.subTitleStyle.copyWith(color: enterColor),
            ),
          ],
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
              "${lessonDetails!.provider!.title} ${lessonDetails!.provider!.firstName} ${lessonDetails!.provider!.lastName}",
              style: TextStyles.hintStyle.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        // const Space(
        //   boxHeight: 30,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       tr("hourly_price"),
        //       style: TextStyles.hintStyle,
        //     ),
        //     Row(
        //       children: [
        //         Text(
        //           lessonDetails!.hourPrice!,
        //           style: TextStyles.hintStyle
        //               .copyWith(fontWeight: FontWeight.bold),
        //         ),
        //         const Space(
        //           boxWidth: 10,
        //         ),
        //         Text(
        //           tr("sar"),
        //           style: TextStyles.hintStyle,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        const Space(
          boxHeight: 30,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       tr("course_hours"),
        //       style: TextStyles.hintStyle.copyWith(color: mainColor),
        //     ),
        //     Row(
        //       children: [
        //         Text(
        //           //
        //           "10",
        //           style: TextStyles.hintStyle
        //               .copyWith(color: mainColor, fontWeight: FontWeight.bold),
        //         ),
        //         const Space(
        //           boxWidth: 10,
        //         ),
        //         Text(
        //           tr("hour"),
        //           style: TextStyles.hintStyle.copyWith(color: mainColor),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        const Space(
          boxHeight: 30,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("priceWithoutTax"),
              style: TextStyles.appBarStyle
                  .copyWith(color: secColor, fontSize: 14.sp),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      lessonDetails?.priceWithoutTax ?? '',
                      style: TextStyles.hintStyle.copyWith(
                          color: secColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Space(
                    boxWidth: 4,
                  ),
                  Text(
                    tr("sar"),
                    style: TextStyles.hintStyle.copyWith(color: secColor),
                  ),
                ],
              ),
            ),
          ],
        ),

        const Space(
          boxHeight: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("tax"),
              style: TextStyles.appBarStyle
                  .copyWith(color: secColor, fontSize: 14.sp),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      lessonDetails!.tax!,
                      style: TextStyles.hintStyle.copyWith(
                          color: secColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Space(
                    boxWidth: 4,
                  ),
                  Text(
                    tr("sar"),
                    style: TextStyles.hintStyle.copyWith(color: secColor),
                  ),
                ],
              ),
            ),
          ],
        ),

        const Space(
          boxHeight: 12,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("total"),
              style: TextStyles.appBarStyle
                  .copyWith(color: secColor, fontSize: 16.sp),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      lessonDetails!.finalPriceWithTax!,
                      style: TextStyles.hintStyle.copyWith(
                          color: secColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Space(
                    boxWidth: 4,
                  ),
                  Text(
                    tr("sar"),
                    style: TextStyles.hintStyle.copyWith(color: secColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/icon/icons.dart';
import '../../../res/drawable/image/images.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/space/space.dart';

class RequstCourseDetailsCard extends StatelessWidget {
  const RequstCourseDetailsCard({super.key, required this.courseDetailsModel});
  final dynamic courseDetailsModel;

  @override
  Widget build(BuildContext context) {
    final String hourPrice =
        (double.parse(courseDetailsModel.priceWithoutTax.replaceAll(",", "")) /
                double.parse(courseDetailsModel.numberOfHours!.toString()))
            .toStringAsFixed(2);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 60.w,
                height: 60.h,
                decoration: const BoxDecoration(shape: BoxShape.rectangle),
                child: Image.asset(course)),
            const Space(
              boxWidth: 10,
            ),
            Expanded(
              child: Text(courseDetailsModel.name!,
                  // "دورة فى فن إدارة الاعمال و التطور للمبتدئين",
                  style: TextStyles.appBarStyle.copyWith(
                      color: blackColor, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("course"),
              style: TextStyles.errorStyle.copyWith(color: mainColor),
            ),
            Text(
              courseDetailsModel.type == 1 ? tr("offline") : tr("live"),
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
              boxWidth: 10,
            ),
            Text(
              "${courseDetailsModel.provider!.title} ${courseDetailsModel.provider!.firstName} ${courseDetailsModel.provider!.lastName}",
              // "أ/ عادل السيد",
              style: TextStyles.hintStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Space(
          boxHeight: 10,
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
                  hourPrice.toString(),
                  // "80",
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
          boxHeight: 10,
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
                  courseDetailsModel.numberOfHours.toString(),
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
          boxHeight: 10,
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
                      courseDetailsModel!.priceWithoutTax!,
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
                      courseDetailsModel!.tax!,
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
                      courseDetailsModel!.priceWithTax!,
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

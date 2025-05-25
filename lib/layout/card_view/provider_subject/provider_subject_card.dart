import 'package:easy_localization/easy_localization.dart' as e;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/res/value/color/color.dart';

import '../../../res/drawable/image/images.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';
import '../../activity/provider_screens/subject_details/subject_details_provider.dart';

class ProviderSubjectCard extends StatelessWidget {
  final dynamic data;
  const ProviderSubjectCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 35,
      child: GestureDetector(
        onTap: () => Get.to(SubjectDetailsProviderScreen(
          id: data.id!,
        )),
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
              color: profileBorderCardColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: profileBorderCardColor)),
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${data.provider!.title} ${data.provider!.firstName} ${data.provider!.lastName}",
                        style: TextStyles.textView16SemiBold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.hourPrice.toString(),
                          style: TextStyles.textView16SemiBold
                              .copyWith(color: mainColor),
                        ),
                        Text(
                          e.tr("sar"),
                          style: TextStyles.textView16SemiBold
                              .copyWith(color: mainColor),
                        ),
                        Text(
                          "/",
                          style: TextStyles.titleStyle.copyWith(color: black),
                        ),
                        Text(
                          e.tr("hour"),
                          style: TextStyles.errorStyle
                              .copyWith(color: profileBorderCardColor),
                        ),
                      ],
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
                    const Space(
                      boxWidth: 5,
                    ),
                    Text(
                      data.provider!.rate.toString(),
                      style: TextStyles.subTitleStyle.copyWith(
                          color: secColor, fontWeight: FontWeight.w700),
                    ),
                    const Space(
                      boxWidth: 5,
                    ),
                    Text(
                      "(${data.provider!.rateCount} ${e.tr("rater")})",
                      style: TextStyles.smallStyle.copyWith(color: secColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${data.subscriptions.toString()} ${e.tr("subscriber")}",
                        style: TextStyles.textView12Bold),
                    Text(
                        e.DateFormat("d/MM/yy h:m:s", "en")
                            .format(data.times![0].startsAt)
                            .toString(),
                        textDirection: TextDirection.rtl,
                        style: TextStyles.textView16Regular),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(e.tr("subject_details"),
                        style: TextStyles.unselectedStyle.copyWith(
                            color: mainColor, fontWeight: FontWeight.bold)),
                    const Space(
                      boxWidth: 5,
                    ),
                    Image.asset(moreInfo, height: 10.h, fit: BoxFit.contain),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

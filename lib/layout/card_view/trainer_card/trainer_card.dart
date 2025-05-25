import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/image/images.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/image_handler/image_from_network/network_image.dart';
import '../../../widget/space/space.dart';

class TrainerCard extends StatelessWidget {
  final dynamic courseDetailsModel;
  final bool isLesson;

  const TrainerCard({
    super.key,
    required this.courseDetailsModel,
    this.isLesson = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      color: profileColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: isLesson == true
                      ? CachedImage(
                          imageUrl: courseDetailsModel.provider!.image ?? "",
                          width: screenWidth,
                          height: 130.h,
                          fit: BoxFit.cover,
                        )
                      : CachedImage(
                          imageUrl:
                              courseDetailsModel.provider!.imagePath ?? "",
                          width: screenWidth,
                          height: 130.h,
                          fit: BoxFit.cover,
                        ),
                ),
                Space(boxWidth: 5.w),
                Expanded(
                  child: Text(
                    "${courseDetailsModel.provider!.title} ${courseDetailsModel.provider!.firstName} ${courseDetailsModel.provider!.lastName} ",
                    softWrap: true,
                    style: TextStyles.appBarStyle.copyWith(color: black),
                  ),
                ),
                Image.asset(
                  star,
                  height: 15.h,
                  fit: BoxFit.contain,
                ),
                const Space(
                  boxWidth: 5,
                ),
                Text(
                  courseDetailsModel.provider.rate.toString(),
                  style: TextStyles.subTitleStyle
                      .copyWith(color: secColor, fontWeight: FontWeight.w700),
                ),
                const Space(
                  boxWidth: 5,
                ),
                Text(
                  "(${courseDetailsModel.provider.rateCount!} ${tr("rater")})",
                  style: TextStyles.smallStyle,
                ),
              ],
            ),
            SizedBox(
              width: screenWidth,
              child: Text(
                "${courseDetailsModel.provider!.bio}",
                softWrap: true,
                style: TextStyles.errorStyle.copyWith(color: grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

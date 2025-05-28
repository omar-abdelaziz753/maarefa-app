import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/drawable/image/images.dart';
import '../../../res/effects/blur/effect/blur_effect.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/course_info/course_info.dart';
import '../../../widget/image_handler/image_from_network/network_image.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';

class CourseCard extends StatelessWidget {
  final bool isBlue, isShowBookmark;
  final VoidCallback? onPress, favoriteTap;
  final dynamic courseModel;
  final dynamic bookmarkCoursesModel;
  final String? attendType;
  final int? id;

  const CourseCard(
      {super.key,
      this.isBlue = false,
      this.isShowBookmark = true,
      this.onPress,
      this.courseModel,
      this.bookmarkCoursesModel,
      this.attendType,
      required this.favoriteTap,
      this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SidePadding(
        sidePadding: 15,
        child: Stack(
          alignment: FractionalOffset.center,
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Container(
                width: screenWidth,
                height: 315.h,
                decoration: const BoxDecoration(
                  color: white,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Stack(
                      alignment: FractionalOffset.topLeft,
                      children: [
                        Center(
                          child: CachedImage(
                            imageUrl: courseModel == null
                                ? bookmarkCoursesModel!.image!
                                : courseModel!.image!,
                            width: screenWidth,
                            height: 190.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        attendType == null
                            ? const SizedBox()
                            : BlurEffect(
                                boxHeight: 30,
                                boxWidth: 80,
                                radius: 20,
                                child: Center(
                                  child: Text(attendType ?? "",
                                      style: TextStyles.errorStyle.copyWith(
                                          color: white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                      ],
                    ),
                    const Space(
                      boxHeight: 35,
                    ),
                    CourseInfo(
                        rate: courseModel == null
                            ? bookmarkCoursesModel!.provider.rate?.toString()
                            : courseModel!.provider.rate?.toString(),
                        rater: courseModel == null
                            ? "(${bookmarkCoursesModel!.provider.rateCount ?? ""} ${tr("rater")})"
                            : "(${courseModel!.provider.rateCount ?? ""} ${tr("rater")})",
                        speciality: courseModel == null
                            ? bookmarkCoursesModel!.specialization!.name
                                .toString()
                            : courseModel!.specialization!.name.toString(),
                        courseModel: courseModel,
                        bookmarkCoursesModel: bookmarkCoursesModel),
                  ],
                ),
              ),
            ),
            SidePadding(
              sidePadding: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 30.h,
                              width: 30.w,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CachedImage(
                                imageUrl: courseModel == null
                                    ? bookmarkCoursesModel!.provider.image ?? ""
                                    : courseModel!.provider!.imagePath ?? "",
                                width: 30.w,
                                height: 30.h,
                                fit: BoxFit.cover,
                              )),
                          const Space(
                            boxWidth: 5,
                          ),
                          Text(
                            courseModel == null
                                ? "${bookmarkCoursesModel!.provider!.title} /${bookmarkCoursesModel!.provider!.firstName} ${bookmarkCoursesModel!.provider!.lastName}"
                                : "${courseModel!.provider!.title} /${courseModel!.provider!.firstName} ${courseModel!.provider!.lastName}",
                            style: TextStyles.errorStyle.copyWith(color: black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isShowBookmark
                      ? GestureDetector(
                          onTap: favoriteTap,
                          child: courseModel == null
                              ? Image.asset(
                                  isBlue ? blueBookmarkIcon : bookmarkIcon,
                                  height: 45.h,
                                  fit: BoxFit.contain)
                              : Image.asset(
                                  isBlue ? blueBookmarkIcon : bookmarkIcon,
                                  height: 45.h,
                                  fit: BoxFit.contain),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

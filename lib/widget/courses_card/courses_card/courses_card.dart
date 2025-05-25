import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/model/user/show_providers/show_providers_model.dart';
import 'package:my_academy/res/effects/blur/effect/blur_effect.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/course_info/course_info.dart';
import 'package:my_academy/widget/image_handler/image_from_network/network_image.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

class CoursesCardUi extends StatelessWidget {
  const CoursesCardUi(
      {super.key,
      this.id,
      this.attendType,
      this.image,
      this.courseModel,
      this.onPress,
      this.providerImage,
      this.speciality,
      this.rater,
      this.rate});
  final ProviderCourses? courseModel;
  final VoidCallback? onPress;
  // final BookmarkCoursesModel? bookmarkCoursesModel;
  final String? attendType;
  final String? image;
  final String? providerImage;
  final int? id;
  final String? rate;
  final String? rater;
  final String? speciality;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SidePadding(
        sidePadding: 35,
        child: Stack(
          alignment: FractionalOffset.center,
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Container(
                width: screenWidth,
                height: 260.h,
                color: white,
                child: Column(
                  children: [
                    Stack(
                      alignment: FractionalOffset.topLeft,
                      children: [
                        CachedImage(
                          imageUrl: image ?? "",
                          width: screenWidth,
                          height: 130.h,
                          fit: BoxFit.fill,
                        ),
                        // CachedNetworkImage(
                        //   imageUrl: courseModel == null
                        //       ? bookmarkCoursesModel!.image!
                        //       : courseModel!.image!,
                        //   width: screenWidth,
                        //   height: 130.h,
                        //   fit: BoxFit.cover,
                        //   placeholder: (context, url) => const Logo(
                        //     logoHeight: 75,
                        //     logoWidth: 75,
                        //   ),
                        // ),
                        BlurEffect(
                          boxHeight: 30,
                          boxWidth: 80,
                          radius: 20,
                          child: Center(
                            child: Text(attendType.toString(),
                                style: TextStyles.errorStyle.copyWith(
                                    color: white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    CourseInfo(
                      rate: rate,
                      rater: rater,
                      speciality: speciality,
                      courseModel: courseModel,
                    ),
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
                              imageUrl: providerImage ?? "",
                              width: 30.w,
                              height: 30.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            // "",
                            // courseModel == null
                            //     ? bookmarkCoursesModel!.name!
                            //     :
                            "${courseModel!.provider!.title}/ ${courseModel!.provider!.firstName} ${courseModel!.provider!.lastName}",
                            style: TextStyles.errorStyle.copyWith(color: black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // BlocProvider(
                  //   create: (BuildContext context) =>
                  //       BookmarkCubit(
                  //           BookmarksRepository()),
                  //   child: BlocConsumer<BookmarkCubit, BookmarkState>(
                  //       listener: (context, state) {},
                  //       builder: (context, state) {
                  //         final bookmarkCubit = BookmarkCubit.get(context);
                  //         final courseSubjectCubit =
                  //         CourseSubjectCubit.get(context);
                  //         // if (state is BookmarkCoursesLoadingState) {
                  //         //   return  ;
                  //         // }
                  //         return GestureDetector(
                  //           onTap: () {
                  //             bookmarkCubit.addToBookMark(
                  //                 id: courseModel != null
                  //                     ? courseModel!.id!
                  //                     : bookmarkCoursesModel!.id!,
                  //                 type: 'course');
                  //             if (courseModel != null) {
                  //               courseSubjectCubit.getCourses(1,id!);
                  //             } else {
                  //               bookmarkCubit.getBookmarkCourses();
                  //             }
                  //           },
                  //           child: courseModel == null
                  //               ? Image.asset(
                  //               bookmarkCoursesModel!.isBookmarked!
                  //                   ? blueBookmarkIcon
                  //                   : bookmarkIcon,
                  //               height: 45.h,
                  //               fit: BoxFit.contain)
                  //               : Image.asset(
                  //               courseModel!.isBookmarked!
                  //                   ? blueBookmarkIcon
                  //                   : bookmarkIcon,
                  //               height: 45.h,
                  //               fit: BoxFit.contain),
                  //         );
                  //       }),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

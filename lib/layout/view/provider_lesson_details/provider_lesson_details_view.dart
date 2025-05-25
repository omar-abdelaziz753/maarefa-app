import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../bloc/lesson_details/lesson_details_provider_cubit.dart';
import '../../../bloc/provider_course_details/provider_course_details_cubit.dart';
import '../../../model/common/lessons/lesson_model.dart';
import '../../../repository/provider/lesson_details/lesson_details_repository.dart';
import '../../../res/drawable/image/images.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/alert/delete/delete_alert.dart';
import '../../../widget/buttons/master/master_button.dart';
import '../../../widget/error/page/error_page.dart';
import '../../../widget/loader/loader.dart';
import '../../../widget/logo/logo/logo.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';
import '../../activity/provider_screens/add_contant/add_content_screen.dart';
import '../../activity/user_screens/trainer/trainer_screen.dart';
import '../../card_view/trainer_card/trainer_card.dart';

class ProviderLessonDetailsView extends StatelessWidget {
  const ProviderLessonDetailsView({super.key, required this.id});
  final int id;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LessonDetailsProviderCubit(
              lessonDetailsProviderRepository:
                  LessonDetailsProviderRepository(),
              id: id,
            )..getLessonDetails(),
        child: BlocConsumer<LessonDetailsProviderCubit,
                LessonDetailsProviderState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder<LessonDetailsProviderCubit,
                  LessonDetailsProviderState>(builder: (context, state) {
                if (state is LessonDetailsLoadedState) {
                  final data = (state).data;
                  return lessonDetailsView(context, data!);
                } else if (state is CourseDetailsErrorState) {
                  return const ErrorPage();
                } else {
                  return const Loading();
                }
              });
            }));
  }

  lessonDetailsView(context, LessonDetails lessonDetails) {
    return BlocProvider(
        create: (BuildContext context) => LessonDetailsProviderCubit(
            lessonDetailsProviderRepository: LessonDetailsProviderRepository(),
            id: id),
        child: BlocConsumer<LessonDetailsProviderCubit,
                LessonDetailsProviderState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = LessonDetailsProviderCubit.get(context);

              return SingleChildScrollView(
                  child: Column(children: [
                Stack(alignment: FractionalOffset.topCenter, children: [
                  Image.asset(profileBackground,
                      height: 235.h, width: screenWidth, fit: BoxFit.fill),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Space(
                        boxHeight: 150,
                      ),
                      Stack(
                        alignment: FractionalOffset.bottomRight,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.h),
                            child: Container(
                              height: 135.h,
                              width: 135.w,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                  color: white, shape: BoxShape.circle),
                              child: Center(
                                child: Container(
                                  height: 125.h,
                                  width: 125.w,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: const BoxDecoration(
                                      color: profileBorderCardColor,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            lessonDetails.provider!.image!,
                                        width: 125.w,
                                        height: 125.h,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            const SizedBox(),
                                        placeholder: (context, url) =>
                                            const Logo(
                                              logoHeight: 50,
                                              logoWidth: 50,
                                            )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Image.asset(
                          //     lessonDetails.isBookmarked
                          //         ? blueBookmarkIcon
                          //         : bookmarkIcon,
                          //     height: 50.h,
                          //     fit: BoxFit.contain),
                        ],
                      ),
                      Text(lessonDetails.provider!.firstName!,
                          textAlign: TextAlign.center,
                          style: TextStyles.appBarStyle.copyWith(
                              fontSize: 20.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w700)),
                      Text(lessonDetails.provider!.title!,
                          textAlign: TextAlign.center,
                          style: TextStyles.hintStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            star,
                            height: 15.h,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            lessonDetails.provider!.rate!.toString(),
                            style: TextStyles.subTitleStyle.copyWith(
                                color: secColor, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "(${lessonDetails.provider!.rateCount!} ${tr("rater")})",
                            style: TextStyles.smallStyle,
                          ),
                        ],
                      ),
                      const Space(
                        boxHeight: 20,
                      ),
                      SidePadding(
                        sidePadding: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  lessonDetails.subject!.name!,
                                  style: TextStyles.introStyle.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                //Todo:implement the exact params
                                Text(
                                  "${lessonDetails.educationalStage!.name}-${lessonDetails.educationalYear!.name}",
                                  style: TextStyles.hintStyle,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      lessonDetails.hourPrice!,
                                      style: TextStyles.selectedStyle
                                          .copyWith(fontSize: 40.sp),
                                    ),
                                    Text(
                                      tr("sar"),
                                      style: TextStyles.roleStyle.copyWith(
                                          color: mainColor, fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                                Text(
                                  tr("per_hour"),
                                  style: TextStyles.roleStyle.copyWith(
                                      color: mainColor, fontSize: 20.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Space(
                        boxHeight: 20,
                      ),
                      SidePadding(
                        sidePadding: 35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                tr("subject_details"),
                                style: TextStyles.appBarStyle
                                    .copyWith(color: blackColor),
                              ),
                            ),
                            Text(
                              lessonDetails.content!,
                              style: TextStyles.hintStyle,
                            ),
                          ],
                        ),
                      ),
                      Space(boxHeight: 10.h),
                      SidePadding(
                        sidePadding: 35,
                        child: GestureDetector(
                          onTap: () => Get.to(() => TrainerScreen(
                                id: lessonDetails.provider!.id!,
                                isUser: false,
                              )),
                          child: TrainerCard(
                            courseDetailsModel: lessonDetails,
                            isLesson: true,
                          ),
                        ),
                      ),
                      const Space(boxHeight: 20),
                      if (lessonDetails.times!.isNotEmpty)
                        Wrap(
                          children: List.generate(
                            lessonDetails.times!.length,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 3.w),
                                child: ChoiceChip(
                                  backgroundColor: white,
                                  shape: RoundedRectangleBorder(
                                    side:
                                        const BorderSide(color: textfieldColor),
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  onSelected: (t) {},
                                  selectedColor: mainColor,
                                  label: Column(
                                    children: [
                                      Text(
                                          DateFormat("yyyy-MM-dd", "en").format(
                                              DateTime.parse(lessonDetails
                                                  .times![index].startsAt
                                                  .toString())),
                                          style: const TextStyle(
                                            color: black,
                                          )),
                                      Text(
                                          "${DateFormat("HH:mm", "en").format(DateTime.parse(lessonDetails.times![index].startsAt.toString()))} - ${DateFormat("HH:mm", "en").format(DateTime.parse(lessonDetails.times![index].endsAt.toString()))}",
                                          style: TextStyles.appBarStyle
                                              .copyWith(
                                                  color: black,
                                                  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  selected: false,
                                ),
                              );
                            },
                          ),
                        ),
                      const Space(boxHeight: 30),
                      MasterButton(
                        sidePadding: 35,
                        // buttonStyle:
                        //     TextStyles.appBarStyle.copyWith(color: mainColor),
                        onPressed: () {
                          Get.to(
                            () => AddContentScreen(
                              lesson: lessonDetails,
                            ),
                          );
                        },
                        buttonText: tr("repeat"),
                      ),
                      Space(boxHeight: 10.h),
                      MasterButton(
                          sidePadding: 35,
                          borderColor: transparent,
                          buttonColor: circleColor.withOpacity(0.1),
                          buttonStyle: TextStyles.appBarStyle
                              .copyWith(color: circleColor),
                          onPressed: () => deleteAlert(
                                deleteTap: () => bloc.deleteLesson(id),
                              ),
                          buttonText: tr("deactive")),
                      const Space(boxHeight: 30),
                    ],
                  ),
                ]),
              ]));
            }));
  }
}

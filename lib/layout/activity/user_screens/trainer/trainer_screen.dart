import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../bloc/bookmark/bookmark_cubit.dart';
import '../../../../bloc/show_provider_details/provider_info_cubit.dart';
import '../../../../repository/user/show_providers/show_providers_repository.dart';
import '../../../../res/drawable/image/images.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/image_handler/image_from_network/network_image.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/master_list/custom_list.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';
import '../../../card_view/course/course_card.dart';
import '../../provider_screens/course_details/course_details.dart';
import '../course/course_registration.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key, required this.id, required this.isUser});
  final int id;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            ProviderInfoCubit(ShowProvidersRepository()),
        child: BlocConsumer<ProviderInfoCubit, ProviderInfoState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                  appBar: DefaultAppBar(title: tr("trainer")),
                  body: BlocProvider(
                    create: (BuildContext context) =>
                        ProviderInfoCubit(ShowProvidersRepository())
                          ..getProviderDetails(id),
                    child: BlocConsumer<ProviderInfoCubit, ProviderInfoState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is ProviderInfoLoaded) {
                          final data = state.data;
                          return ListView(children: [
                            SidePadding(
                              sidePadding: 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenWidth,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 100.h,
                                          width: 100.w,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedImage(
                                            imageUrl: data.provider!.imagePath!,
                                            height: 130.h,
                                            fit: BoxFit.cover,
                                          ),
                                          // Image(image: AssetImage(provider)),
                                        ),
                                        Space(boxWidth: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${data.provider!.firstName!} ${data.provider!.lastName!} ",
                                              style: TextStyles.appBarStyle
                                                  .copyWith(color: black),
                                            ),
                                            Text(
                                              data.provider!.title!,
                                              style: TextStyles.errorStyle
                                                  .copyWith(color: grey),
                                            ),
                                            Text(
                                              data.provider!.degree ?? "",
                                              style: TextStyles.errorStyle
                                                  .copyWith(color: grey),
                                            ),
                                            Space(
                                              boxHeight: 10.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  star,
                                                  height: 15.h,
                                                  fit: BoxFit.contain,
                                                ),
                                                Text(
                                                  data.provider!.rate
                                                      .toString(),
                                                  style: TextStyles
                                                      .subTitleStyle
                                                      .copyWith(
                                                          color: secColor,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                                Text(
                                                  "(${data.provider!.rateCount ?? 0} ${tr("rater")})",
                                                  style: TextStyles.smallStyle,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Space(boxHeight: 20),
                                  Text(
                                    data.provider!.bio!,
                                    style: TextStyles.contentStyle,
                                  ),
                                  const Space(boxHeight: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        tr("specialties"),
                                        style: TextStyles.appBarStyle
                                            .copyWith(color: black),
                                      ),
                                      Text(
                                        "${data.provider!.specializations!.length} ${tr("specialty")}",
                                        style: TextStyles.hintStyle,
                                      ),
                                    ],
                                  ),
                                  Space(boxHeight: 10.h),
                                  Wrap(
                                    children: List.generate(
                                        data.provider!.specializations!.length,
                                        (index) => Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h, horizontal: 3.w),
                                            child: ChoiceChip(
                                                backgroundColor: profileColor,
                                                shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        color: textfieldColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.r)),
                                                onSelected: (t) {},
                                                selectedColor: mainColor,
                                                label: Text(
                                                    data
                                                        .provider!
                                                        .specializations![index]
                                                        .name!,
                                                    style: TextStyles
                                                        .appBarStyle
                                                        .copyWith(
                                                            color: mainColor,
                                                            fontWeight: FontWeight.bold)),
                                                selected: false))),
                                  ),
                                  Space(boxHeight: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        tr("t_courses"),
                                        style: TextStyles.appBarStyle
                                            .copyWith(color: black),
                                      ),
                                      Text(
                                        tr("course_arg", args: [
                                          data.courses!.length.toString()
                                        ]),
                                        style: TextStyles.hintStyle,
                                      )
                                    ],
                                  ),
                                  Space(boxHeight: 10.h),
                                ],
                              ),
                            ),
                            CustomList(
                                listHeight: 1000000000000,
                                listWidth: screenWidth,
                                axis: Axis.vertical,
                                scroll: const NeverScrollableScrollPhysics(),
                                count: data.courses!.length,
                                child: (context, index) => CourseCard(
                                      isShowBookmark: false,
                                      isBlue:
                                          data.courses![index].isBookmarked!,
                                      favoriteTap: () {
                                        // bloc.bookmarkCourse(index);
                                        BlocProvider.of<BookmarkCubit>(context)
                                            .addToBookMark(
                                                id: data.courses![index].id!,
                                                type: "course");
                                      },
                                      id: id,
                                      attendType: data.courses![index].type == 1
                                          ? tr("offline")
                                          : tr("online"),
                                      // Get.locale!.languageCode == "en"
                                      //     ? bloc.typeListEn[1]
                                      //     : bloc.typeListAr[1]:data[index].attendanceType==2?Get.locale!.languageCode == "en"
                                      //     ? bloc.typeListEn[3]
                                      //     : bloc.typeListAr[3]:Get.locale!.languageCode == "en"
                                      //     ? bloc.typeListEn[2]
                                      //     : bloc.typeListAr[2],
                                      onPress: isUser == false
                                          ? () => Get.to(CourseDetails(
                                                id: data.courses![index].id!,
                                                // isUser: false,
                                              ))
                                          : () => Get.to(
                                                CourseRegistration(
                                                  id: data.courses![index].id!,
                                                  isUser: false,
                                                ),
                                              ),
                                      courseModel: data.courses![index],
                                      // image: data.courses![index].image,
                                      // providerImage: data
                                      //     .courses![index].provider!.imagePath,
                                      // courseModel: data.courses![index],
                                      // speciality: data.courses![index]
                                      //         .specialization!.name ??
                                      //     "",
                                      // rate:
                                      //     data.courses![index].rate.toString(),
                                      // rater:
                                      //     "(${data.courses![index].rateCount} ${tr("rater")})",
                                      // attendType: data.courses![index].type == 1
                                      //     ? tr("offline")
                                      //     : tr("live"),
                                    )),
                            const Space(boxHeight: 20),
                          ]);
                        } else if (state is ProviderInfoError) {
                          return const ErrorPage();
                        }
                        return const Loading();
                      },
                    ),
                  ));
            }));
  }
}

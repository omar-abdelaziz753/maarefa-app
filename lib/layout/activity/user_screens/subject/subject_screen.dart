import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../bloc/bookmark/bookmark_cubit.dart';
import '../../../../res/drawable/image/images.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/buttons/back/back_button.dart';
import '../../../../widget/buttons/master/master_button.dart';
import '../../../../widget/logo/logo/logo.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';
import '../../../card_view/trainer_card/trainer_card.dart';
import '../../provider_screens/calender/calender_table_screen.dart';
import '../trainer/trainer_screen.dart';

class SubjectScreen extends StatefulWidget {
  final dynamic lessonDetails;
  final bool isUser;

  const SubjectScreen({
    super.key,
    required this.lessonDetails,
    required this.isUser,
  });

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  bool isFavorite = false;
  initFavorite() {
    setState(() {
      isFavorite = widget.lessonDetails.isBookmarked;
    });
  }

  @override
  void initState() {
    initFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        leading: const MasterBackButton(),
      ),
      body: SingleChildScrollView(
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
                                imageUrl: widget.lessonDetails.provider!.image,
                                width: 125.w,
                                height: 125.h,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const SizedBox(),
                                placeholder: (context, url) => const Logo(
                                      logoHeight: 50,
                                      logoWidth: 50,
                                    )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        BlocProvider.of<BookmarkCubit>(context).addToBookMark(
                            id: widget.lessonDetails.id!, type: 'lesson');
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Image.asset(
                        isFavorite ? blueBookmarkIcon : bookmarkIcon,
                        height: 50.h,
                        fit: BoxFit.contain),
                  ),
                ],
              ),
              Text(widget.lessonDetails.provider!.firstName!,
                  textAlign: TextAlign.center,
                  style: TextStyles.appBarStyle.copyWith(
                      fontSize: 20.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w700)),
              Text(widget.lessonDetails.provider!.title!,
                  textAlign: TextAlign.center, style: TextStyles.hintStyle),
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
                    widget.lessonDetails.provider!.rate!.toString(),
                    style: TextStyles.subTitleStyle
                        .copyWith(color: secColor, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "(${widget.lessonDetails.provider!.rateCount!} )",
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
                          widget.lessonDetails.subject!.name!,
                          style: TextStyles.introStyle.copyWith(
                              color: blackColor, fontWeight: FontWeight.bold),
                        ),
                        //Todo:implement the exact params
                        Text(
                          "${widget.lessonDetails.educationalStage.name}-${widget.lessonDetails.educationalYear.name}",
                          style: TextStyles.hintStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.lessonDetails.hourPrice!,
                              style: TextStyles.selectedStyle
                                  .copyWith(fontSize: 30.sp),
                            ),
                            Text(
                              tr("sar"),
                              style: TextStyles.roleStyle
                                  .copyWith(color: mainColor, fontSize: 20.sp),
                            ),
                          ],
                        ),
                        Text(
                          tr("per_hour"),
                          style: TextStyles.roleStyle
                              .copyWith(color: mainColor, fontSize: 20.sp),
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
                        style:
                            TextStyles.appBarStyle.copyWith(color: blackColor),
                      ),
                    ),
                    Text(
                      widget.lessonDetails.content!,
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
                        id: widget.lessonDetails.provider!.id!,
                        isUser: widget.isUser,
                      )),
                  child: TrainerCard(
                    courseDetailsModel: widget.lessonDetails,
                    isLesson: true,
                  ),
                ),
              ),
              const Space(
                boxHeight: 20,
              ),
              MasterButton(
                buttonText: tr("available_appointments"),
                sidePadding: 35,
                buttonColor: mainColor,
                onPressed: () => Get.to(
                    () => CalenderScreen(lessonDetails: widget.lessonDetails)),
              ),
              const Space(
                boxHeight: 50,
              ),
            ],
          ),
        ]),
      ])),
    );
  }
}

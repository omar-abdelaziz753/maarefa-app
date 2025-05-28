import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/res/drawable/icon/icons.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';

import '../../../res/value/style/textstyles.dart';
import '../../../widget/logo/logo/logo.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';
import '../../activity/user_screens/request/course_pay/pay_screen.dart';

class RequestSubjectCard extends StatelessWidget {
  const RequestSubjectCard(
      {super.key,
      required this.lessonTitle,
      required this.lessonId,
      required this.id,
      required this.name,
      required this.price,
      required this.onlineCheck,
      required this.acceptanceCheck,
      required this.onTap});
  final String lessonTitle;
  final int id, lessonId;
  final String name;
  final String price;
  final String onlineCheck;
  final String acceptanceCheck;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 15,
      child: InkWell(
        onTap: () => Get.to(() => PayScreen(
              type: "lesson",
              id: lessonId,
              isRequest: true,
              requestId: id,
            )),
        child: Container(
          padding: const EdgeInsets.all(5),
          width: screenWidth,
          // height: 110.h,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: textfieldColor,
            ),
          ),
          child: Column(
            children: [
              SidePadding(
                sidePadding: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 75.h,
                              child: Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: BoxDecoration(
                                    // color: white,
                                    gradient: blueGradient,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 60.w,
                                    height: 60.h,
                                    decoration: const BoxDecoration(
                                        color: white, shape: BoxShape.circle),
                                    child: const Logo(
                                      logoHeight: 60,
                                      logoWidth: 60,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50.h,
                              right: 5.w,
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                width: 55.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    color: black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Center(
                                    child: Text(tr("online"),
                                        style: TextStyles.errorStyle
                                            .copyWith(color: white))),
                              ),
                            ),
                          ],
                        ),
                        const Space(
                          boxHeight: 5,
                        ),
                        Text("#$id",
                            style: TextStyles.errorStyle
                                .copyWith(color: textfieldColor)),
                      ],
                    ),
                    const Space(
                      boxWidth: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        // width: screenWidth * 0.3,
                        // child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // children: [
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(lessonTitle,
                              softWrap: true,
                              maxLines: 2,
                              style: TextStyles.appBarStyle.copyWith(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 5, vertical: 3),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(30),
                        //       border: Border.all(color: Colors.black)),
                        //   child: Text(onlineCheck),
                        // ),
                        // ],
                        // ),
                        // ),
                        SizedBox(
                          width: screenWidth / 2,
                          child: Row(
                            children: [
                              Image.asset(
                                profile,
                                height: 15.h,
                                fit: BoxFit.contain,
                                color: textfieldColor,
                              ),
                              Text(name, style: TextStyles.hintStyle),
                              // const Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 2,
                          child: Row(
                            children: [
                              Image.asset(money,
                                  height: 15.h, fit: BoxFit.contain),
                              Text("$price ${tr("sar")}",
                                  style: TextStyles.hintStyle),
                              const Spacer(),
                              Text(acceptanceCheck,
                                  style: TextStyles.hintStyle
                                      .copyWith(color: blackColor)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/buttons/master/master_button.dart';
import '../../../widget/side_padding/side_padding.dart';

class RightHomeCard extends StatelessWidget {
  final String title, subTitle, buttonText, image;
  final VoidCallback? onTap;
  const RightHomeCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.image,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 20,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Get.locale!.languageCode == "ar"
              ? FractionalOffset.centerLeft
              : FractionalOffset.centerRight,
          children: [
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Container(
                width: screenWidth,
                // height: 240.h,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: white,
                        // spreadRadius: 5,
                        // blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: mainLightColor,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(5.r)),
                child: SidePadding(
                  sidePadding: 10,
                  child: SizedBox(
                    width: screenWidth / 2,
                    height: 220.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: screenWidth / 2,
                            height: 70.h,
                            child: Text(title,
                                maxLines: 2,
                                style: TextStyles.titleStyle
                                    .copyWith(color: white))),
                        SizedBox(
                          width: screenWidth * 0.45,
                          height: 85.h,
                          child: Text(subTitle,
                              maxLines: 3,
                              softWrap: true,
                              style: TextStyles.hintStyle
                                  .copyWith(color: cvColor)),
                        ),
                        SizedBox(
                          // width: screenWidth / 2.5,
                          child: MasterButton(
                              onPressed: onTap,
                              buttonText: buttonText,
                              buttonRadius: 50.r,
                              buttonColor: white.withOpacity(0.9),
                              borderColor: white.withOpacity(0.9),
                              sidePadding: 0,
                              buttonWidth: 165.w,
                              buttonHeight: 65.h,
                              buttonStyle: TextStyles.errorStyle.copyWith(
                                  color: cvColor, fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Image.asset(
              image,
              height: 220.h,
              width: screenWidth * 0.4,
            ),
          ],
        ),
      ),
    );
  }
}

class LeftHomeCard extends StatelessWidget {
  final String title, subTitle, buttonText, image;
  final VoidCallback? onTap;
  const LeftHomeCard(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.image,
      required this.subTitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 20,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Get.locale!.languageCode == "ar"
              ? FractionalOffset.centerRight
              : FractionalOffset.centerLeft,
          children: [
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Container(
                width: screenWidth,
                height: 220.h,
                decoration: BoxDecoration(
                    color: mainLightColor,
                    border: Border.all(color: borderColor),
                    boxShadow: const [
                      BoxShadow(
                        color: white,
                        // spreadRadius: 5,
                        // blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5.r)),
                child: Row(
                  children: [
                    const Spacer(),
                    SidePadding(
                      sidePadding: 10,
                      child: SizedBox(
                        // width: screenWidth * 0.4,
                        height: 240.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.4,
                                height: 70.h,
                                child: Text(title,
                                    maxLines: 2,
                                    style: TextStyles.titleStyle
                                        .copyWith(color: white))),
                            SizedBox(
                                width: screenWidth * 0.4,
                                height: 85.h,
                                child: Text(subTitle,
                                    maxLines: 3,
                                    softWrap: true,
                                    style: TextStyles.hintStyle
                                        .copyWith(color: cvColor))),
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: MasterButton(
                                  onPressed: onTap,
                                  buttonText: buttonText,
                                  borderColor: white.withOpacity(0.9),
                                  buttonColor: white.withOpacity(0.9),
                                  buttonRadius: 50.r,
                                  sidePadding: 0,
                                  buttonWidth: 165.w,
                                  buttonHeight: 65.h,
                                  buttonStyle: TextStyles.errorStyle.copyWith(
                                      color: cvColor,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              image,
              height: 235.h,
              width: screenWidth * 0.4,
            ),
          ],
        ),
      ),
    );
  }
}

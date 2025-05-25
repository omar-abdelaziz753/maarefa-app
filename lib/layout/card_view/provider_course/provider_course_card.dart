import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' as e;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/drawable/image/images.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/logo/logo/logo.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';
import '../../activity/provider_screens/course_details/course_details.dart';

class ProviderCourseCard extends StatelessWidget {
  final dynamic data;
  const ProviderCourseCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 35,
      child: InkWell(
        onTap: () => Get.to(() => CourseDetails(
              id: data.id,
            )),
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: profileBorderCardColor)),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 100.w,
                height: 120.h,
                child: Stack(
                  alignment: FractionalOffset.topCenter,
                  children: [
                    Positioned.fill(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r)),
                        child: CachedNetworkImage(
                            imageUrl: data.image ?? "",
                            width: 90.w,
                            height: 90.h,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Logo(
                                  logoHeight: 75,
                                  logoWidth: 80,
                                )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: 55.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              data?.provider?.rate.toString() ?? '',
                              style: TextStyles.subTitleStyle.copyWith(
                                  color: secColor, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.name.toString(),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.textView16Bold,
                        ),
                        Row(
                          children: [
                            Text(
                              data.price.toString(),
                              style: TextStyles.priceStyle,
                            ),
                            Text(
                              e.tr("sar"),
                              style: TextStyles.hintStyle
                                  .copyWith(color: blackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      data.specialization!.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.hintStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${data.subscriptions} ${e.tr("subscriber")}",
                            style: TextStyles.textView12Bold),
                        Text(
                            data.nextTime == ""
                                ? ""
                                : e.DateFormat("d/MM/yy h:m:s", "en")
                                    .format(DateTime.parse(data.nextTime)),
                            style: TextStyles.errorStyle.copyWith(
                                color: textfieldColor, fontSize: 14.sp)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(e.tr("course_details"),
                            style: TextStyles.unselectedStyle.copyWith(
                                color: mainColor, fontWeight: FontWeight.bold)),
                        const Space(
                          boxWidth: 5,
                        ),
                        Image.asset(moreInfo,
                            height: 10.h, fit: BoxFit.contain),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

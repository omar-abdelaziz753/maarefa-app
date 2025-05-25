import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/widget/image_handler/image_from_network/network_image.dart';

import '../../../model/common/courses/course_details/course_details_model.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../activity/user_screens/specification/specification_screen.dart';

class SpecificationCard extends StatelessWidget {
  final Specialization specializationsModel;

  const SpecificationCard({
    super.key,
    required this.specializationsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => SpecificationScreen(
          title: specializationsModel.name!, id: specializationsModel.id)),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: textfieldColor),
            borderRadius: BorderRadius.circular(5.r)),
        child: Container(
          height: 80.h,
          width: (screenWidth - 80.w) / 2,
          color: courseTypeColor,
          child: SidePadding(
              sidePadding: 5,
              child: Row(
                children: [
                  Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: CachedImage(
                        imageUrl: specializationsModel.image ?? "",
                        width: 60.w,
                        height: 75.h,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 75.w,
                    child: Text(
                      specializationsModel.name ?? "",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyles.hintStyle.copyWith(color: grey),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

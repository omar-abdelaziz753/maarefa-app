import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/res/value/style/textstyles.dart';

import '../../../model/common/courses/course_details/course_details_model.dart';
import '../../../res/value/color/color.dart';
import '../../../widget/space/space.dart';

class ShowCourseDetailsCard extends StatelessWidget {
  final CourseDetailsModel courseDetailsModel;

  const ShowCourseDetailsCard({super.key, required this.courseDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr("course_detials"),
          style: TextStyles.appBarStyle.copyWith(color: black),
        ),
        const Space(boxHeight: 10),
        Text(
          courseDetailsModel.content ?? "",
          style: TextStyles.hintStyle,
        ),
        const Space(boxHeight: 10),
        //Todo: ExpansionTile
        // InkWell(
        //   onTap: (){},
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         tr("show_more"),
        //         style: TextStyles.subTitleStyle,
        //       ),
        //       const Icon(
        //         Icons.keyboard_arrow_down,
        //         color: mainColor,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

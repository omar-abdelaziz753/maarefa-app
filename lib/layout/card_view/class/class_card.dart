import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/user_screens/class/class_screen.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    super.key,
    required this.name,
    required this.id,
    required this.stageId,
  });
  final String name;
  final int id;
  final int stageId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.to(() => ClassScreen(id: id, stageId: stageId, name: name)),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Container(
          height: 75.h,
          width: (screenWidth - 80.w) / 2,
          color: mainColor.withOpacity(0.1),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: mainColor,
            radius: Radius.circular(5.r),
            child: Center(
                child: Text(
              name,
              style: TextStyles.subTitleStyle,
            )),
          ),
        ),
      ),
    );
  }
}

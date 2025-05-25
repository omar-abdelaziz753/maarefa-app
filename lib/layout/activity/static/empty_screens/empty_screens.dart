import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../../res/value/color/color.dart';

class EmptyScreen extends StatelessWidget {
  final String title, image;
  final double width, height;
  final Color? color;

  const EmptyScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.width,
      required this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 40,
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image,
                height: height / 2,
                fit: BoxFit.contain,
                color: color ?? mainColor.withOpacity(0.1)),
            Space(
              boxHeight: 30.h,
            ),
            Text(
              tr(title),
              style: TextStyles.titleStyle.copyWith(color: color ?? blackColor),
            ),
          ],
        ),
      ),
    );
  }
}

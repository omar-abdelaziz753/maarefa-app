import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../res/value/color/color.dart';
import '../../side_padding/side_padding.dart';

class RoleWidget extends StatelessWidget {
  final String image;
  final bool isUser;
  final TextStyle style;
  final Color borderColor;
  final VoidCallback? onTap;
  const RoleWidget(
      {super.key,
      required this.image,
      required this.isUser,
      required this.borderColor,
      required this.style,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 10.w,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.w,
              height: 160.h,
              padding: const EdgeInsets.all(8),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: borderColor, width: 1.w),
              ),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            const Space(boxHeight: 20),
            Text(isUser ? tr("user") : tr("provider"), style: style),
          ],
        ),
      ),
    );
  }
}

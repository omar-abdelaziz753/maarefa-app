import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/value/color/color.dart';

import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../side_padding/side_padding.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 15,
      child: SizedBox(
        width: screenWidth,
        child: Row(
          children: [
            Container(
              width: (screenWidth - 120.w) / 2,
              height: 1.h,
              color: textfieldColor,
            ),
            SizedBox(
              width: 50.w,
              child: Center(
                  child: Text(tr("or"),
                      style: TextStyles.appBarStyle.copyWith(color: grey))),
            ),
            Container(
              width: (screenWidth - 120.w) / 2,
              height: 1.h,
              color: textfieldColor,
            ),
          ],
        ),
      ),
    );
  }
}

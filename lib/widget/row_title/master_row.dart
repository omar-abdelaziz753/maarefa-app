import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/value/color/color.dart';
import '../../res/value/style/textstyles.dart';
import '../side_padding/side_padding.dart';

class MasterRow extends StatelessWidget {
  final String title, subTitle;
  final VoidCallback? onTap;
  const MasterRow({
    super.key,
    this.onTap,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      // sidePadding: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.appBarStyle
                .copyWith(fontSize: 14.sp)
                .copyWith(color: blackColor, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                // color: white,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$subTitle >>",
                  style: TextStyles.subTitleStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

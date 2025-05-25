import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/value/color/color.dart';

import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/image_handler/image_from_network/network_image.dart';

class GradeCard extends StatelessWidget {
  const GradeCard(
      {super.key,
      this.isSelected = false,
      this.title,
      this.image,
      required this.id,
      required this.onTap});
  final String? title, image;
  final int id;
  final VoidCallback? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: isSelected ? mainColor : textfieldColor),
            borderRadius: BorderRadius.circular(10.r)),
        child: Container(
          height: 85.h,
          width: screenWidth,
          color: isSelected ? mainColor : courseTypeColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: CachedImage(
                    imageUrl: image ?? "",
                    width: 60.w,
                    height: 75.h,
                    fit: BoxFit.cover,
                  )),
              Text(title ?? "",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: isSelected
                      ? TextStyles.textView14SemiBold.copyWith(color: white)
                      : TextStyles.textView14SemiBold.copyWith(color: grey)),
            ],
          ),
        ),
      ),
    );
  }
}

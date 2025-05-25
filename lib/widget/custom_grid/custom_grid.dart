import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/value/dimenssion/dimenssions.dart';

class CustomGrid extends StatelessWidget {
  final Widget Function(BuildContext, int) child;
  final ScrollPhysics? scroll;
  final double? listHeight;
  final double? aspectRatio;
  final double? mainSpacing;
  final double? crossSpacing;
  final int count;
  final int? crossAxisCount;
  final Axis? axis;

  const CustomGrid(
      {super.key,
      required this.child,
      required this.count,
      this.scroll,
      this.aspectRatio,
      this.listHeight,
      this.crossAxisCount,
      this.axis,
      this.mainSpacing,
      this.crossSpacing});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: listHeight ?? screenHeight,
      // maxWidth: listWidth == null ? screenWidth : listWidth!.w,
      child: GridView.builder(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        physics: scroll ?? const NeverScrollableScrollPhysics(),
        scrollDirection: axis ?? Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount ?? 2,
            childAspectRatio: aspectRatio ?? 150.w / 60.h),
        itemCount: count,
        itemBuilder: child,
      ),
    );
  }
}

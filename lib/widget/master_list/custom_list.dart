import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/value/dimenssion/dimenssions.dart';

class CustomList extends StatelessWidget {
  final Widget Function(BuildContext, int)? child;
  final int count;
  final Axis axis;
  final double listHeight;
  final ScrollPhysics? scroll;
  final double? listWidth;
  final ScrollController? controller;
  const CustomList(
      {super.key,
      this.child,
      this.controller,
      this.axis = Axis.vertical,
      this.count = 1,
      this.listWidth,
      this.listHeight = 5,
      this.scroll});
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: listHeight.h,
      maxWidth: listWidth == null ? screenWidth : listWidth!.w,
      child: ListView.builder(
        controller: controller,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        physics: scroll,
        scrollDirection: axis,
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: child!,
      ),
    );
  }
}

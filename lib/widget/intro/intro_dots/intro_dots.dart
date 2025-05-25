import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/value/color/color.dart';
import '../../side_padding/side_padding.dart';

class IntroDot extends StatelessWidget {
  final Color color;
  final double width;
  const IntroDot({super.key, required this.color, required this.width});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 3,
      child: Container(
        height: 10.w,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: white)),
      ),
    );
  }
}

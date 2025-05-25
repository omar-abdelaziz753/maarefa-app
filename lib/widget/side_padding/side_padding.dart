import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidePadding extends StatelessWidget {
  final double sidePadding;
  final Widget? child;
  const SidePadding({super.key, this.child, this.sidePadding = 0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: sidePadding.w, right: sidePadding.w),
      child: child,
    );
  }
}

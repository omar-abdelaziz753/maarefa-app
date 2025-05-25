import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../side_padding/side_padding.dart';

class MasterLoadButton extends StatelessWidget {
  final Color? buttonColor;
  final RoundedLoadingButtonController buttonController;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? buttonRadius;
  final double? sidePadding;
  final String buttonText;
  final TextStyle? buttonStyle;
  final VoidCallback? onPressed;
  const MasterLoadButton(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      required this.buttonController,
      this.buttonHeight,
      this.buttonRadius,
      this.buttonWidth,
      this.buttonStyle,
      this.onPressed,
      this.sidePadding});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: sidePadding ?? 0,
      child: SizedBox(
        width: buttonWidth == null ? screenWidth : buttonWidth!.w,
        child: RoundedLoadingButton(
          controller: buttonController,
          onPressed: onPressed,color:buttonColor?? mainColor,
          animateOnTap: true,
          borderRadius: buttonRadius == null ? 10.r : buttonRadius!.r,
          width: buttonWidth == null ? screenWidth : buttonWidth!.w,
          height: buttonHeight == null ? 70.h : buttonHeight!.h,
          elevation: 0.0,
          child: Center(
            child: Text(
              buttonText,
              style:
                  buttonStyle ?? TextStyles.appBarStyle.copyWith(color: white),
            ),
          ),
        ),
      ),
    );
  }
}

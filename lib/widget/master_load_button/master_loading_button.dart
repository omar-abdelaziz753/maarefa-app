import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/value/dimenssion/dimenssions.dart';
import '../../res/value/style/textstyles.dart';
import '../side_padding/side_padding.dart';
import 'app_loading_button.dart';

class MasterLoadingButton extends StatelessWidget {
  final double sidePadding;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? buttonRadius;
  final AppLoadingButtonController buttonController;
  final double? fontSize;
  final String buttonText;
  final Gradient buttonColor;
  final TextStyle? buttonStyle;
  final VoidCallback? onPressed;
  const MasterLoadingButton({
    super.key,
    required this.buttonColor,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonController,
    this.buttonRadius,
    this.fontSize,
    required this.buttonText,
    this.onPressed,
    this.sidePadding = 0,
    this.buttonStyle,
  });
  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: sidePadding,
      child: SizedBox(
        height: buttonHeight == null ? 55.h : buttonHeight!.h,
        child: AppLoadingButton(
          animateOnTap: true,
          borderRadius: buttonRadius == null ? 4.r : buttonRadius!.r,
          width: buttonWidth == null ? screenWidth : buttonWidth!.w,
          height: buttonHeight == null ? 55.h : buttonHeight!.h,
          buttonColor: buttonColor,
          controller: buttonController,
          elevation: 0.0,
          onPressed: onPressed,
          child: SizedBox(
            height: buttonHeight == null ? 55.h : buttonHeight!.h,
            width: buttonWidth == null ? screenWidth : buttonWidth!.w,
            child: Center(
              child: Text(
                buttonText,
                style: buttonStyle ?? TextStyles.appBarStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

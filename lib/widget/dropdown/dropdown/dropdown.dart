import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../space/space.dart';

class BuildDropDown extends StatelessWidget {
  final double? buttonHeight;
  final double? buttonWidth;
  final double? buttonRadius;
  final Color? dropdownColor;
  final Widget? icon;
  final bool? isExpanded;
  final String hint;
  final String image;
  final dynamic value;
  final dynamic onChange;
  final List<DropdownMenuItem<dynamic>> items;

  const BuildDropDown({
    super.key,
    this.dropdownColor,
    this.icon,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonRadius,
    required this.isExpanded,
    required this.hint,
    required this.value,
    required this.onChange,
    required this.items,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: LimitedBox(
        maxHeight: buttonHeight ?? 70.h,
        maxWidth: buttonWidth ?? screenWidth,
        child: Container(
          height: buttonHeight ?? 70.h,
          decoration: BoxDecoration(
              border: Border.all(
                color: textfieldColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(buttonRadius ?? 10.r)),
          child: DropdownButton<dynamic>(
            isExpanded: isExpanded!,
            elevation: 0,
            hint: Row(
              children: [
                Space(
                  boxWidth: 10.w,
                ),
                Image.asset(image, height: 20.h, fit: BoxFit.contain),
                Space(
                  boxWidth: 5.w,
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: buttonWidth,
                    child: Text(hint,
                        style: TextStyles.textView14SemiBold
                            .copyWith(color: mainColor)),

                  ),
                ),
              ],
            ),
            icon: icon ?? const Icon(Icons.arrow_drop_down, color: black),
            dropdownColor: dropdownColor ?? white,
            style: TextStyles.textView14SemiBold.copyWith(color: mainColor),
            borderRadius: BorderRadius.circular(buttonRadius ?? 4.r),
            value: value,
            onChanged: onChange,
            items: items,
          ),
        ),
      ),
    );
  }
}

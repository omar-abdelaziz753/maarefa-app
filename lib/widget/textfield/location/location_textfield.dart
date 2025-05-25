import 'package:flutter/material.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';

class LocationTextField extends StatelessWidget {
  final dynamic onChanged;
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLines;
  final double? cursorHeight;
  final double? textHeight;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextInputType? textInputType;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validate;
  const LocationTextField(
      {super.key,
      this.contentPadding,
      this.cursorHeight,
      this.fontColor,
      this.fontSize,
      this.fontWeight,
      this.hintStyle,
      this.hintText,
      this.maxLines,
      this.onChanged,
      this.textEditingController,
      this.textHeight,
      this.textInputType,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textEditingController,
      // textAlign: TextAlign.left,
      maxLines: maxLines,
      cursorHeight: cursorHeight,
      keyboardType: textInputType,
      validator: validate,
      style: TextStyles.hintStyle.copyWith(
        height: textHeight,
        fontSize: fontSize,
        color: fontColor ?? blackColor,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        border: InputBorder.none,
        contentPadding: contentPadding,
      ),
    );
  }
}

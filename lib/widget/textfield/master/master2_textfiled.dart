import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../../side_padding/side_padding.dart';

class Master2TextField extends StatelessWidget {
  final double? sidePadding;
  final double? fieldHeight;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final bool? autofocus;
  final Color? borderColor;
  final String? errorText;
  final String hintText;
  final double? borderRadius;
  final String? prefixIcon;
  final String? suffixText;
  final String? suffixIcon;
  final bool isError;

  // final Color? suffixColor;
  final int? maxLines;
  final int? minLines;
  final Function(String)? onChanged;
  const Master2TextField({
    super.key,
    this.autofocus,
    this.borderColor,
    this.controller,
    this.fieldHeight,
    this.errorText,
    required this.hintText,
    this.borderRadius,
    this.isPassword,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    //this.suffixColor,
    this.sidePadding,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.isError=false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SidePadding(
          sidePadding: sidePadding ?? 0,
          child: LimitedBox(
            maxHeight: fieldHeight == null ? 70.h : fieldHeight!.h,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              keyboardType: keyboardType,
              obscureText: isPassword ?? false,
              maxLines: maxLines ?? 1,
              minLines: minLines ?? 1,
              autofocus: autofocus ?? false,
              style: TextStyles.appBarStyle.copyWith(color: black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        borderRadius == null ? 5.r : borderRadius!.r)),
                    borderSide: BorderSide(
                      color: textfieldColor,
                      width: 1.w,
                      style: BorderStyle.solid,
                    )),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        borderRadius == null ? 5.r : borderRadius!.r)),
                    borderSide: BorderSide(
                      color: textfieldColor,
                      width: 1.w,
                      style: BorderStyle.solid,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        borderRadius == null ? 5.r : borderRadius!.r)),
                    borderSide: BorderSide(
                      color: textfieldColor,
                      width: 1.w,
                      style: BorderStyle.solid,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        borderRadius == null ? 5.r : borderRadius!.r)),
                    borderSide: BorderSide(
                      color: borderColor ?? mainColor,
                      width: 1.w,
                      style: BorderStyle.solid,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        borderRadius == null ? 5.r : borderRadius!.r)),
                    borderSide: BorderSide(
                      color: errorText != null ? red : textfieldColor,
                      width: 1.w,
                      style: BorderStyle.solid,
                    )),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        borderRadius == null ? 5.r : borderRadius!.r)),
                    borderSide: BorderSide(
                      color: errorText != null ? red : textfieldColor,
                      width: 1.w,
                      style: BorderStyle.solid,
                    )),
                hintText: hintText,
                hintStyle: TextStyles.appBarStyle.copyWith(color: mainColor),
                suffixIcon: suffixIcon == null
                    ? const SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 25.h),
                            child: Image.asset(suffixIcon!,
                                height: 15.h, fit: BoxFit.contain),
                          ),
                        ],
                      ),

                // prefixIcon: prefixIcon == null
                //     ? const SizedBox()
                //     : Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.symmetric(vertical: 25.h),
                //             child: Image.asset(prefixIcon!,
                //                 height: 20.h, fit: BoxFit.contain),
                //           ),
                //         ],
                //       ),
              ),
            ),
          ),
        ),
        errorText != null
            ? Padding(
                padding: EdgeInsets.only(
                  left: sidePadding ?? 0,
                  right: sidePadding ?? 0,
                ),
                child: Text(
                  errorText!,
                  textAlign: TextAlign.start,
                  style: TextStyles.errorStyle,
                ),
              )
            : Container(),
      ],
    );
  }
}

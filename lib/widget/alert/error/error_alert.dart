import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../res/drawable/lottie/lottie.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../../buttons/master/master_button.dart';
import '../../side_padding/side_padding.dart';
import '../../space/space.dart';

showErrorAlert({required String message, VoidCallback? onTap}) {
  showDialog(
      context: Get.context!,
      builder: (context) => Dialog(
            backgroundColor: white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.r))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Space(
                  boxHeight: 30,
                ),
                Lottie.asset(
                  error,
                  height: 75.h,
                  fit: BoxFit.contain,
                ),
                const Space(
                  boxHeight: 20,
                ),
                SidePadding(
                  sidePadding: 15,
                  child: Text(
                    message,
                    style: TextStyles.textView14SemiBold,
                  ),
                ),
                const Space(
                  boxHeight: 30,
                ),
                MasterButton(
                  buttonWidth: 120,
                  sidePadding: 0,
                  buttonHeight: 50,
                  buttonStyle: TextStyles.errorStyle.copyWith(color: white),
                  buttonText: tr("ok"),
                  onPressed: onTap ?? () => Get.back(),
                ),
                const Space(boxHeight: 30),
              ],
            ),
          ));
}

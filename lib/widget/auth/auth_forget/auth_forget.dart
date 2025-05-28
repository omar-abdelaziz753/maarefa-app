import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/auth/forget/forget_password_screen.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../../side_padding/side_padding.dart';

class AuthForget extends StatelessWidget {
  const AuthForget({super.key});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => const ForgetPasswordScreen());
            },
            child: Text(
              tr("forget_password"),
              style: TextStyles.subTitleStyle
                  .copyWith(color: secColor, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

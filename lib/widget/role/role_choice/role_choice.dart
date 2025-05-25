import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/widget/role/role_widget/role_widget.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

import '../../../res/drawable/image/images.dart';
import '../../../res/value/style/textstyles.dart';
import '../../space/space.dart';

class RoleChoice extends StatelessWidget {
  final VoidCallback? userTap, providerTap;
  final bool isUser;
  const RoleChoice(
      {super.key, this.userTap, this.providerTap, this.isUser = true});

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 10.w,
      child: Column(
        children: [
          RoleWidget(
              onTap: userTap,
              image: user,
              isUser: true,
              borderColor: isUser == true ? mainColor : grey,
              style: isUser == true
                  ? TextStyles.roleStyle
                      .copyWith(color: mainColor, fontWeight: FontWeight.bold)
                  : TextStyles.roleStyle.copyWith(color: grey)),
          const Space(boxHeight: 20),
          RoleWidget(
              onTap: providerTap,
              image: provider,
              isUser: false,
              borderColor: isUser == false ? mainColor : grey,
              style: isUser == false
                  ? TextStyles.roleStyle
                      .copyWith(color: mainColor, fontWeight: FontWeight.bold)
                  : TextStyles.roleStyle.copyWith(color: grey)),
        ],
      ),
    );
  }
}

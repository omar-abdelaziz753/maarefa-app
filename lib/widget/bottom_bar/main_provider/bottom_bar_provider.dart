import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/bottom_bar/bottom_bar_cubit.dart';
import '../../../res/drawable/icon/icons.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../custom_floating/custom_floating.dart';

class ProviderBottomBar extends StatelessWidget {
  const ProviderBottomBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BottomBarCubit>(context, listen: true);
    return CustomFloatingNavbar(
      onTap: (int index) => bloc.changeProviderBar(index),
      currentIndex: bloc.selectedProvider,
      backgroundColor: mainColor,
      unselectedItemColor: white,
      iconSize: 18.h,
      dotSize: 10.h,
      textStyle: TextStyles.errorStyle
          .copyWith(color: white, fontWeight: FontWeight.bold),
      items: [
        CustomFloatingNavbarItem(icon: home, title: tr("home")),
        CustomFloatingNavbarItem(icon: subscribe, title: tr("request_sent")),
        CustomFloatingNavbarItem(icon: appointment, title: tr("appointments")),
        CustomFloatingNavbarItem(icon: profile, title: tr("account")),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/bloc/bottom_bar/bottom_bar_cubit.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../../widget/buttons/master/master_button.dart';
import '../main/main_screen.dart';

class BookingStatus extends StatelessWidget {
  const BookingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("booking_status")),
      body: SidePadding(
        sidePadding: 30,
        child: ListView(
          children: [
            const Space(
              boxHeight: 100,
            ),
            Center(
              child: Image.asset(
                trueimage,
                height: 170.h,
              ),
            ),
            const Space(
              boxHeight: 50,
            ),
            Text(
              tr("booked"),
              style: TextStyles.appBarStyle.copyWith(color: black),
            ),
            const Space(
              boxHeight: 200,
            ),
            MasterButton(
              buttonText: tr("main"),
              borderColor: profileColor,
              buttonColor: profileColor,
              buttonStyle: TextStyles.appBarStyle.copyWith(color: mainColor),
              onPressed: () {
                Get.offAll(const MainScreen());
              },
            ),
            const Space(
              boxHeight: 50,
            ),
            MasterButton(
              buttonText: tr("my_subscriptions"),
              onPressed: () {
                BlocProvider.of<BottomBarCubit>(context).selectedIndex = 2;
                Get.to(() => const MainScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

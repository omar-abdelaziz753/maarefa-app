import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

import '../../../../../res/value/style/textstyles.dart';
import '../../../../../widget/space/space.dart';

class SideContentScreen extends StatelessWidget {
  const SideContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("add_content")),
      body: SidePadding(
        sidePadding: 30,
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(question,
                        height: 130.h, width: 100.w, fit: BoxFit.contain),
                    const Space(
                      boxHeight: 30,
                    ),
                    Text(tr("consulting"),
                        textAlign: TextAlign.center,
                        style: TextStyles.appBarStyle
                            .copyWith(color: grey, fontSize: 16))
                  ],
                ),
              ),
            ),
            const Space(boxHeight: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(penFlower,
                        height: 130.h, width: 100.w, fit: BoxFit.contain),
                    const Space(
                      boxHeight: 30,
                    ),
                    Text(tr("courses"),
                        textAlign: TextAlign.center,
                        style: TextStyles.appBarStyle
                            .copyWith(color: grey, fontSize: 16))
                  ],
                ),
              ),
            ),
            const Space(
              boxHeight: 20,
            ),
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage(blueBackground), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: -50,
                  child: Column(
                    children: [
                      Image.asset(
                        mobileImage,
                        height: 210.h,
                        width: 250.w,
                        fit: BoxFit.contain,
                      ),
                      Text(tr("private_lessons"),
                          textAlign: TextAlign.center,
                          style: TextStyles.appBarStyle
                              .copyWith(color: white, fontSize: 22))
                    ],
                  ),
                )
              ],
            ),
            const Space(
              boxHeight: 40,
            ),
            MasterButton(
              buttonText: tr("next"),
              onPressed: () {},
            ),
            const Space(
              boxHeight: 20,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/drawable/image/images.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/buttons/master/master_button.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/slider/slider_container.dart';
import '../../../../widget/space/space.dart';
import '../../../../widget/textfield/master/master_textfield.dart';

class UserFilterScreen extends StatelessWidget {
  const UserFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("filter")),
      body: SidePadding(
        sidePadding: 35,
        child: ListView(
          children: [
            ExpansionTile(
              title: Text(
                tr("specialty"),
                style: TextStyles.agreeStyle.copyWith(color: black),
              ),
              children: [
                // ListTile(title: Text('This is tile number 1')),
                Wrap(
                  children: List.generate(
                      15,
                      (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 3.w),
                          child: ChoiceChip(
                              backgroundColor: white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: textfieldColor),
                                  borderRadius: BorderRadius.circular(25.r)),
                              onSelected: (t) {},
                              selectedColor: mainColor,
                              label: Text(
                                  index.isEven ? "إدارة اعمال" : "رسم ديجيتال",
                                  style: TextStyles.unselectedStyle),
                              selected: false))),
                ),
              ],
            ),
            Space(
              boxHeight: 20.h,
            ),
            ExpansionTile(
              title: Text(
                tr("rate"),
                style: TextStyles.agreeStyle.copyWith(color: black),
              ),
              children: [
                Wrap(
                  children: List.generate(
                      5,
                      (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 3.w),
                          child: ChoiceChip(
                              backgroundColor: white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: textfieldColor),
                                  borderRadius: BorderRadius.circular(25.r)),
                              onSelected: (t) {},
                              selectedColor: mainColor,
                              label: SizedBox(
                                width: 100,
                                height: 35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(star),
                                    const Text("وأكثر"),
                                  ],
                                ),
                              ),
                              selected: false))),
                ),
              ],
            ),
            Space(
              boxHeight: 20.h,
            ),
            ExpansionTile(
              title: Text(
                tr("explanation_type"),
                style: TextStyles.agreeStyle.copyWith(color: black),
              ),
              children: [
                Wrap(
                  children: List.generate(
                      15,
                      (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 3.w),
                          child: ChoiceChip(
                              backgroundColor: white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: textfieldColor),
                                  borderRadius: BorderRadius.circular(25.r)),
                              onSelected: (t) {},
                              selectedColor: mainColor,
                              label: Text(index.isEven ? "حضوري" : "اونلاين",
                                  style: TextStyles.unselectedStyle),
                              selected: false))),
                ),
              ],
            ),
            Space(
              boxHeight: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr("from"),
                        style: TextStyles.agreeStyle,
                      ),
                      const MasterTextField(
                        hintText: "",
                        prefixIcon: null,
                        fieldHeight: 50,
                      )
                    ],
                  ),
                ),
                Space(
                  boxWidth: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr("to"),
                        style: TextStyles.agreeStyle,
                      ),
                      const MasterTextField(
                        hintText: "",
                        prefixIcon: null,
                        fieldHeight: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Space(
              boxHeight: 20.h,
            ),
            const SliderContainer(),
            Space(
              boxHeight: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child:
                      MasterButton(onPressed: () {}, buttonText: tr("filter")),
                ),
                Space(
                  boxWidth: 10.w,
                ),
                Expanded(
                  child: MasterButton(
                    buttonColor: profileColor,
                    borderColor: profileColor,
                    onPressed: () {},
                    buttonText: tr("clear_filter"),
                    buttonStyle:
                        TextStyles.appBarStyle.copyWith(color: mainColor),
                  ),
                ),
              ],
            ),
            Space(
              boxHeight: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

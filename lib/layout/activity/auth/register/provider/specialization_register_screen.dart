import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/layout/view/specialization/specialization_register/specialization_register_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../res/value/color/color.dart';
import '../../../../../res/value/style/textstyles.dart';
import '../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../../widget/side_padding/side_padding.dart';
import '../../../../../widget/space/space.dart';

class SpecializationRegisterScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const SpecializationRegisterScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("register")),
      body: ListView(
        children: [
          const Space(
            boxHeight: 35,
          ),
          const SidePadding(
            sidePadding: 35,
            child: StepProgressIndicator(
              totalSteps: 5,
              currentStep: 3,
              selectedColor: mainColor,
              unselectedColor: textfieldColor,
            ),
          ),
          const Space(
            boxHeight: 20,
          ),
          SidePadding(
            sidePadding: 35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr("the_specialty"),
                  style: TextStyles.introStyle
                      .copyWith(color: blackColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  tr("choose_specification"),
                  textAlign: TextAlign.start,
                  style: TextStyles.hintStyle,
                ),
                const Space(
                  boxHeight: 25,
                ),
              ],
            ),
          ),
          SpecializationRegisterView(data: data),
        ],
      ),
    );
  }
}

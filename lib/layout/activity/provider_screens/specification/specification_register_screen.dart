import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/repository/provider/auth_provider/auth_provider_repository.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../bloc/auth/provider/auth_provider_cubit.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/buttons/master/master_button.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';

class SpecificationRegisterScreen extends StatelessWidget {
  const SpecificationRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            AuthProviderCubit(AuthProviderRepository()),
        child: BlocConsumer<AuthProviderCubit, AuthProviderState>(
            listener: (context, state) {},
            builder: (context, state) {
              // final bloc = AuthCubit.get(context);
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
                            tr("specification"),
                            textAlign: TextAlign.start,
                            style: TextStyles.introStyle.copyWith(
                                color: blackColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            tr("choose_specification"),
                            textAlign: TextAlign.start,
                            style: TextStyles.hintStyle,
                          ),
                          const Space(
                            boxHeight: 25,
                          ),
                          Wrap(
                            children: List.generate(
                                9,
                                (index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 3.w),
                                    child: ChoiceChip(
                                        backgroundColor: white,
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: textfieldColor),
                                            borderRadius:
                                                BorderRadius.circular(25.r)),
                                        onSelected: (t) {},
                                        selectedColor: mainColor,
                                        label: Text(
                                            index.isEven
                                                ? "مستشار مهني"
                                                : "مدرب",
                                            style: TextStyles.unselectedStyle),
                                        selected: false))),
                          ),
                        ],
                      ),
                    ),
                    Space(
                      boxHeight: screenHeight / 3,
                    ),
                    MasterButton(
                        // onPressed: () =>
                        // Get.to(() => const GradesRegisterScreen()),
                        sidePadding: 35,
                        buttonText: tr("next")),
                    const Space(
                      boxHeight: 100,
                    ),
                  ],
                ),
              );
            }));
  }
}

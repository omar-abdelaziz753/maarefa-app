import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/bloc/auth/provider/auth_provider_cubit.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../repository/provider/auth_provider/auth_provider_repository.dart';
import '../../../../../res/value/color/color.dart';
import '../../../../../res/value/style/textstyles.dart';
import '../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../../widget/side_padding/side_padding.dart';
import '../../../../../widget/space/space.dart';
import '../../../../view/grades/grades_register/grades_register_view.dart';

class GradesRegisterScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const GradesRegisterScreen({super.key, required this.data});

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
                      sidePadding: 15,
                      child: StepProgressIndicator(
                        totalSteps: 5,
                        currentStep: 4,
                        selectedColor: mainColor,
                        unselectedColor: textfieldColor,
                      ),
                    ),
                    const Space(
                      boxHeight: 20,
                    ),
                    SidePadding(
                      sidePadding: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(
                              text: "${tr("grades")} ",
                              style: TextStyles.introStyle.copyWith(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "(${tr("optional")})",
                                  style: TextStyles.hintStyle
                                      .copyWith(color: textfieldColor),
                                )
                              ])),
                          Text(
                            tr("choose_grade"),
                            textAlign: TextAlign.start,
                            style: TextStyles.hintStyle,
                          ),
                          const Space(
                            boxHeight: 25,
                          ),
                        ],
                      ),
                    ),
                    GradesRegisterView(data: data),
                  ],
                ),
              );
            }));
  }
}

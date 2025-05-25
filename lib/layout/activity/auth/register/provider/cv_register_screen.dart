import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../bloc/auth/provider/auth_provider_cubit.dart';
import '../../../../../bloc/cv_hint_cubit.dart';
import '../../../../../repository/provider/auth_provider/auth_provider_repository.dart';
import '../../../../../repository/static_pages/settings_repository.dart';
import '../../../../../res/drawable/image/images.dart';
import '../../../../../res/value/color/color.dart';
import '../../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../../res/value/style/textstyles.dart';
import '../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../../widget/buttons/master_load/master_load_button.dart';
import '../../../../../widget/side_padding/side_padding.dart';
import '../../../../../widget/space/space.dart';

class CVRegisterScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const CVRegisterScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CvHintCubit>(
      create: (context) => CvHintCubit(SettingsRepository())..fgetCvNote(),
      child: BlocBuilder<CvHintCubit, CvHintState>(
        builder: (context, cvState) {
          return BlocProvider(
              create: (BuildContext context) =>
                  AuthProviderCubit(AuthProviderRepository()),
              child: BlocConsumer<AuthProviderCubit, AuthProviderState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final bloc = AuthProviderCubit.get(context);
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
                              currentStep: 5,
                              selectedColor: mainColor,
                              unselectedColor: textfieldColor,
                            ),
                          ),
                          const Space(
                            boxHeight: 20,
                          ),
                          SidePadding(
                              sidePadding: 35,
                              child: Text(
                                tr("cv"),
                                style: TextStyles.introStyle.copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold),
                              )),
                          cvState is! CvHintSuccess
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Center(child: CircularProgressIndicator())
                                    ])
                              : SidePadding(
                                  sidePadding: 35,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cvState.note,
                                        textAlign: TextAlign.start,
                                        style: TextStyles.hintStyle,
                                      ),
                                      const Space(
                                        boxHeight: 25,
                                      ),
                                      InkWell(
                                        onTap: () => bloc.pickCV(),
                                        child: Container(
                                          height: 220.h,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                            color: cvBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                bloc.cvFile != null
                                                    ? Text(
                                                        bloc.cvFile!.path
                                                            .toString()
                                                            .split('/')
                                                            .last,
                                                      )
                                                    : Image.asset(cv,
                                                        height: 100,
                                                        fit: BoxFit.contain),
                                                Text(tr("cv"),
                                                    style: TextStyles
                                                        .subTitleStyle
                                                        .copyWith(
                                                            color: cvColor,
                                                            fontSize: 17.sp)),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          Space(
                            boxHeight: screenHeight / 3,
                          ),
                          MasterLoadButton(
                              buttonController: bloc.authController,
                              onPressed: () {
                                bloc.verifyProvider(data);
                              },
                              sidePadding: 35,
                              buttonText: tr("next")),
                          const Space(
                            boxHeight: 100,
                          ),
                        ],
                      ),
                    );
                  }));
        },
      ),
    );
  }
}

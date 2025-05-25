import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../bloc/auth/provider/auth_provider_cubit.dart';
import '../../../../../repository/provider/auth_provider/auth_provider_repository.dart';
import '../../../../../res/drawable/icon/icons.dart';
import '../../../../../res/drawable/image/images.dart';
import '../../../../../res/value/color/color.dart';
import '../../../../../res/value/style/textstyles.dart';
import '../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../../widget/buttons/master/master_button.dart';
import '../../../../../widget/side_padding/side_padding.dart';
import '../../../../../widget/space/space.dart';
import '../../../../../widget/textfield/master/master_textfield.dart';

class AboutRegisterScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const AboutRegisterScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
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
                        currentStep: 2,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 250.h,
                            width: 250.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(provider)),
                                shape: BoxShape.circle),
                            // child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: const []),
                          ),
                          Space(
                            boxHeight: 10.h,
                          ),
                          Text(
                            tr("about_provider"),
                            style: TextStyles.introStyle.copyWith(
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Space(
                            boxHeight: 10.h,
                          ),
                          Text(
                            tr("write_about_provider"),
                            style: TextStyles.hintStyle.copyWith(
                              color: grey,
                            ),
                          ),
                          MasterTextField(
                            controller: bloc.bio,
                            hintText: tr("about"),
                            prefixIcon: emojiIcon,
                            maxLines: 5,
                            minLines: 5,
                            maxLength: 999,
                            fieldHeight: 210,
                            errorText: bloc.validators[0],
                            onChanged: (val) => bloc.validate(val, 0, false),
                          )
                        ],
                      ),
                    ),
                    const Space(
                      boxHeight: 75,
                    ),
                    MasterButton(
                        onPressed: () => bloc.validateBio(data),
                        sidePadding: 35,
                        buttonText: tr("next")),
                    const Space(
                      boxHeight: 50,
                    ),
                  ],
                ),
              );
            }));
  }
}

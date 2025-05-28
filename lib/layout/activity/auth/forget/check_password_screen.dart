import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/auth/timer/timer_widget.dart';
import 'package:my_academy/widget/buttons/master_load/master_load_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../bloc/auth/user/auth_cubit.dart';
import '../../../../repository/user/auth_user/auth_user_repository.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/toast/toast.dart';

class CheckPasswordScreen extends StatelessWidget {
  final String email;
  // final Map<String, dynamic> data;
  const CheckPasswordScreen({
    super.key,
    required this.email,
    // required this.data
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AuthUserCubit(AuthUserRepository()),
        child: BlocConsumer<AuthUserCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = AuthUserCubit.get(context);
              return Scaffold(
                  appBar: DefaultAppBar(title: ""),
                  body: ListView(children: [
                    const Space(
                      boxHeight: 80,
                    ),
                    SidePadding(
                      sidePadding: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 250.h,
                            // width: double.maxFinite,
                            decoration: const BoxDecoration(
                              image:
                                  DecorationImage(image: AssetImage(trueimage)),
                            ),
                          ),
                          Space(
                            boxHeight: 20.h,
                          ),
                          Text(
                            tr("check_password"),
                            style: TextStyles.hintStyle.copyWith(
                              color: grey,
                            ),
                          ),
                          Space(
                            boxHeight: 30.h,
                          ),
                          Text(email),
                          Space(
                            boxHeight: 30.h,
                          ),
                          Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: PinCodeTextField(
                              controller: bloc.code,
                              appContext: context,
                              length: 4,
                              onChanged: (value) {},
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 60,
                                fieldWidth: 60,
                                inactiveColor: textfieldColor,
                                activeColor: white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Space(
                      boxHeight: 10.h,
                    ),
                    MasterLoadButton(
                      onPressed: () {
                        if (bloc.code.text.isEmpty) {
                          showToast(tr("error_code"));
                          bloc.authController.reset();
                        } else {
                          bloc.checkCode(email);
                        }
                      },
                      sidePadding: 15,
                      buttonText: tr("confirm"),
                      buttonController: bloc.authController,
                    ),
                    const Space(
                      boxHeight: 10,
                    ),
                    TimerWidget(
                        buttonController: bloc.authController,
                        email: email,
                        isCode: false,
                        isEdit: false),
                  ]));
            }));
  }
}

import 'dart:io';
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../bloc/auth/provider/auth_provider_cubit.dart';
import '../../../../../repository/provider/auth_provider/auth_provider_repository.dart';
import '../../../../../res/value/color/color.dart';
import '../../../../../res/value/style/textstyles.dart';
import '../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../../widget/auth/timer/timer_widget.dart';
import '../../../../../widget/buttons/master_load/master_load_button.dart';
import '../../../../../widget/side_padding/side_padding.dart';
import '../../../../../widget/space/space.dart';
import '../../../../../widget/toast/toast.dart';

class VerificationScreen extends StatelessWidget {
  final String email;
  final bool isUser;
  final bool isEdit;
  final File? cv;
  final String? code;
  final Map<String, dynamic> data;
  const VerificationScreen(
      {super.key,
      required this.email,
      required this.data,
      this.cv,
      required this.code,
      required this.isUser,
      required this.isEdit});

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
                  appBar: DefaultAppBar(title: ""),
                  body: ListView(children: [
                    const Space(
                      boxHeight: 80,
                    ),
                    SidePadding(
                      sidePadding: 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Container(
                          //   height: 250.h,
                          //   // width: double.maxFinite,
                          //   decoration: const BoxDecoration(
                          //     image:
                          //         DecorationImage(image: AssetImage(trueimage)),
                          //   ),
                          // ),
                          Space(
                            boxHeight: 80.h,
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
                        data.containsKey("code") ? data.remove("code") : () {};
                        if (bloc.code.text.isEmpty) {
                          showToast(tr("error_code"));
                          bloc.codeController.reset();
                        } else if (bloc.code.text != code) {
                          showToast(tr("wrong_code"));
                          bloc.codeController.reset();
                        } else {
                          bloc.registerProvider(cv!, data);
                        }
                      },
                      sidePadding: 35,
                      buttonText: tr("confirm"),
                      buttonController: bloc.codeController,
                    ),
                    const Space(
                      boxHeight: 10,
                    ),
                    TimerWidget(
                        buttonController: bloc.codeController,
                        email: email,
                        isCode: true,
                        isEdit: isEdit,
                        data: data,
                        cv: cv,
                        isUser: isUser),
                  ]));
            }));
  }
}

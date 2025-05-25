import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/icon/icons.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';
import 'package:my_academy/widget/textfield/master/master_textfield.dart';

import '../../../../bloc/auth/user/auth_cubit.dart';
import '../../../../repository/user/auth_user/auth_user_repository.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AuthUserCubit(AuthUserRepository()),
        child: BlocConsumer<AuthUserCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = AuthUserCubit.get(context);
              return Scaffold(
                appBar: DefaultAppBar(title: tr("forget_password")),
                body: ListView(
                  children: [
                    const Space(
                      boxHeight: 80,
                    ),
                    SidePadding(
                      sidePadding: 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 250.h,
                            // width: double.maxFinite,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(notificationmessage)),
                            ),
                          ),
                          Space(
                            boxHeight: 20.h,
                          ),
                          Text(
                            tr("enter_email"),
                            style: TextStyles.hintStyle.copyWith(
                              color: grey,
                            ),
                          ),
                          Space(
                            boxHeight: 30.h,
                          ),
                          MasterTextField(
                            controller: bloc.email,
                            errorText: bloc.validators[0],
                            onChanged: (val) => bloc.validate(val, 0, false),
                            hintText: tr("email"),
                            prefixIcon: email,
                            keyboardType: TextInputType.emailAddress,
                          )
                        ],
                      ),
                    ),
                    const Space(
                      boxHeight: 40,
                    ),
                    MasterLoadButton(
                        onPressed: () => bloc.sendCode(
                            bloc.email.text.trim(), false, false, {}, null),
                        buttonController: bloc.authController,
                        sidePadding: 35,
                        buttonText: tr("send")),
                    const Space(
                      boxHeight: 40,
                    ),
                  ],
                ),
              );
            }));
  }
}

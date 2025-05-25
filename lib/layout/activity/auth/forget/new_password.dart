import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/icon/icons.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/buttons/master_load/master_load_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';
import 'package:my_academy/widget/textfield/master/master_textfield.dart';

import '../../../../bloc/auth/user/auth_cubit.dart';
import '../../../../repository/user/auth_user/auth_user_repository.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key, required this.email, required this.code});
  final String email, code;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AuthUserCubit(AuthUserRepository()),
        child: BlocConsumer<AuthUserCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = AuthUserCubit.get(context);
              return Scaffold(
                  appBar: DefaultAppBar(title: tr("new_password")),
                  body: ListView(children: [
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
                                  image: AssetImage(lockpassword)),
                            ),
                          ),
                          Space(
                            boxHeight: 30.h,
                          ),
                        ],
                      ),
                    ),
                    Space(
                      boxHeight: 40.h,
                    ),
                    MasterTextField(
                      sidePadding: 35,
                      hintText: tr("new_password"),
                      suffixIcon: "eye",
                      errorText: bloc.validators[0],
                      suffixTap: () => bloc.securePassword(),
                      prefixIcon: password,
                      isPassword: bloc.isPassword,
                      controller: bloc.newPass,
                    ),
                    Space(
                      boxHeight: 30.h,
                    ),
                    MasterTextField(
                      sidePadding: 35,
                      suffixIcon: "eye",
                      errorText: bloc.validators[1],
                      hintText: tr("confirm_password"),
                      suffixTap: () => bloc.secureConfirm(),
                      prefixIcon: password,
                      controller: bloc.passConfirm,
                      isPassword: bloc.isConfirm,
                    ),
                    Space(
                      boxHeight: 30.h,
                    ),
                    MasterLoadButton(
                        buttonController: bloc.authController,
                        onPressed: () {
                          bloc.resetPassword(email, code);
                          // Get.to(() => const MainScreen());
                        },
                        sidePadding: 35,
                        buttonText: tr("confirm")),
                    const Space(
                      boxHeight: 100,
                    ),
                  ]));
            }));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../bloc/auth/user/auth_cubit.dart';
import '../../../../repository/user/auth_user/auth_user_repository.dart';
import '../../../../res/drawable/icon/icons.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/auth/auth_forget/auth_forget.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/logo/logo_lottie/logo_lottie.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';
import '../../../../widget/textfield/master/master_textfield.dart';
import '../../role/role_screen.dart';
import '../register/provider/provider_register_screen.dart';
import '../register/user/register_screen.dart';

class LoginScreen extends StatefulWidget {
  final bool isUser;

  const LoginScreen({super.key, this.isUser = true});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AuthUserCubit(AuthUserRepository()),
        child: BlocConsumer<AuthUserCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = AuthUserCubit.get(context);
              return Scaffold(
                appBar: DefaultAppBar(
                    title: "",
                    backPressed: () => Get.to(() => const RoleScreen())),
                body: ListView(
                  children: [
                    const SidePadding(
                      sidePadding: 120,
                      child: LogoLottie(
                        logoHeight: 180,
                        logoWidth: 100,
                      ),
                    ),
                    SidePadding(
                        sidePadding: 35,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Space(
                                boxHeight: 40,
                              ),
                              Center(
                                child: Text(
                                  tr("login"),
                                  textAlign: TextAlign.center,
                                  style: TextStyles.appBarStyle
                                      .copyWith(color: mainColor),
                                ),
                              ),

                              // const Space(
                              //   boxHeight: 15,
                              // ),
                            ])),
                    const Space(
                      boxHeight: 35,
                    ),
                    MasterTextField(
                      sidePadding: 35,
                      hintText: tr("email"),
                      prefixIcon: email,
                      controller: bloc.email,
                      keyboardType: TextInputType.emailAddress,
                      errorText: bloc.validators[0],
                      onChanged: (val) => bloc.validate(val, 0, false),
                    ),
                    const Space(
                      boxHeight: 15,
                    ),
                    MasterTextField(
                      sidePadding: 35,
                      hintText: tr("password"),
                      suffixIcon: "eye",
                      suffixTap: () => bloc.securePassword(),
                      prefixIcon: password,
                      suffixColor: textfieldColor,
                      isPassword: bloc.isPassword,
                      controller: bloc.password,
                      errorText: bloc.validators[1],
                      onChanged: (val) => bloc.validate(val, 1, false),
                    ),
                    const Space(
                      boxHeight: 15,
                    ),
                    const AuthForget(),
                    const Space(
                      boxHeight: 25,
                    ),
                    bloc.loading
                        ? const Loading()
                        : MasterLoadButton(
                            buttonText: tr("login"),
                            sidePadding: 35,
                            buttonController: bloc.authController,
                            onPressed: () {
                              // isUser ?
                              bloc.login();
                            }
                            // :bloc.providerLogin(),
                            ),
                    const Space(
                      boxHeight: 25,
                    ),
                    InkWell(
                      onTap: () => widget.isUser
                          ? Get.to(() => const RegisterScreen())
                          : Get.to(() => const ProviderRegisterScreen()),
                      child: Text(tr("register"),
                          textAlign: TextAlign.center,
                          style: TextStyles.appBarStyle
                              .copyWith(color: mainColor)),
                    ),
                    const Space(
                      boxHeight: 40,
                    ),
                  ],
                ),
              );
            }));
  }
}

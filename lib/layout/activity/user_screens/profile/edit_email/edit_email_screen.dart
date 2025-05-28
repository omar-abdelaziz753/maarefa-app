import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/icon/icons.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/buttons/master_load/master_load_button.dart';
import 'package:my_academy/widget/logo/logo/logo.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';
import 'package:my_academy/widget/textfield/master/master_textfield.dart';

import '../../../../../bloc/profile/user/user_cubit.dart';
import '../../../../../repository/user/edit_profile/user_repository.dart';

class ChangeEmailScreen extends StatelessWidget {
  final bool isUser;
  const ChangeEmailScreen({super.key, required this.isUser});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => UserCubit(UserRepository()),
        child: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = UserCubit.get(context);
              return Scaffold(
                  appBar: DefaultAppBar(title: tr("change_email")),
                  body: ListView(children: [
                    const Space(
                      boxHeight: 80,
                    ),
                    SidePadding(
                      sidePadding: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Logo(
                            logoHeight: 250,
                            logoWidth: 250,
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
                      controller: bloc.email,
                      sidePadding: 15,
                      hintText: tr("email"),
                      prefixIcon: email,
                      errorText: bloc.validators[0],
                      onChanged: (val) => bloc.validate(val, 0, false),
                    ),
                    Space(
                      boxHeight: 30.h,
                    ),
                    MasterLoadButton(
                        buttonController: bloc.controller,
                        onPressed: () => bloc.validateEmail(isUser),
                        sidePadding: 15,
                        buttonText: tr("confirm")),
                    const Space(
                      boxHeight: 100,
                    ),
                  ]));
            }));
  }
}

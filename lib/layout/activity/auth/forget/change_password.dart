import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/icon/icons.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';
import 'package:my_academy/widget/textfield/master/master_textfield.dart';

import '../../../../bloc/profile/user/user_cubit.dart';
import '../../../../repository/user/edit_profile/user_repository.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => UserCubit(UserRepository()),
        child: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = UserCubit.get(context);
              return Stack(
                //   alignment: FractionalOffset.topCenter,
                children: [
                  SizedBox(
                    height: screenHeight,
                    width: screenWidth,
                    // color: Colors.red,
                    child: Image.asset(
                      staticBackground,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: DefaultAppBar(
                        title: tr("change_password"),
                        backgroundColor: transparent),
                    body: SingleChildScrollView(
                      child: Column(
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
                            hintText: tr("old_password"),
                            suffixTap: () => bloc.securePassword(),
                            suffixIcon: "eye",
                            prefixIcon: password,
                            suffixColor: textfieldColor,
                            isPassword: bloc.isOld,
                            controller: bloc.oldPassword,
                            errorText: bloc.validators[0],
                            onChanged: (val) => bloc.validate(val, 0, true),
                          ),
                          Space(
                            boxHeight: 30.h,
                          ),
                          MasterTextField(
                            sidePadding: 35,
                            hintText: tr("new_password"),
                            suffixTap: () => bloc.secureNewPassword(),
                            suffixIcon: "eye",
                            prefixIcon: password,
                            suffixColor: textfieldColor,
                            isPassword: bloc.isPassword,
                            controller: bloc.newPassword,
                            errorText: bloc.validators[1],
                            onChanged: (val) => bloc.validate(val, 1, true),
                          ),
                          Space(
                            boxHeight: 30.h,
                          ),
                          MasterTextField(
                            sidePadding: 35,
                            hintText: tr("confirm_password"),
                            suffixTap: () => bloc.secureConfirm(),
                            suffixIcon: "eye",
                            prefixIcon: password,
                            suffixColor: textfieldColor,
                            isPassword: bloc.isConfirm,
                            controller: bloc.confirm,
                            errorText: bloc.validators[2],
                            onChanged: (val) => bloc.validate(val, 2, true),
                          ),
                          Space(
                            boxHeight: 30.h,
                          ),
                          MasterLoadButton(
                              buttonController: bloc.controller,
                              onPressed: () => bloc.changePassword(),
                              sidePadding: 35,
                              buttonText: tr("save_edits")),
                          const Space(
                            boxHeight: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}

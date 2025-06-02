import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/bloc/role/role_cubit.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/buttons/role_button/role_button.dart';
import 'package:my_academy/widget/role/role_choice/role_choice.dart';
import 'package:my_academy/widget/space/space.dart';

import '../auth/login/login_screen.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          const RoleBackgroundWidget(),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: BlocProvider(
                  create: (BuildContext context) => RoleCubit(),
                  child: BlocConsumer<RoleCubit, RoleState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        final bloc = RoleCubit.get(context);
                        return Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.arrow_back,
                                          color: cvColor,
                                        ),
                                        const Space(boxWidth: 10),
                                        Text(
                                          tr("create_account"),
                                          style: TextStyles.appBarStyle
                                              .copyWith(color: black),
                                        ),
                                      ],
                                    ),
                                    const Space(boxHeight: 20),
                                    Row(
                                      children: [
                                        const Space(boxWidth: 40),
                                        Text(
                                          tr("welcome"),
                                          style: TextStyles.headerStyle
                                              .copyWith(color: cvColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Space(boxHeight: 40),
                            RoleChoice(
                              userTap: () => bloc.changeRole(true),
                              providerTap: () => bloc.changeRole(false),
                              isUser: bloc.isUser,
                            ),
                            Space(boxHeight: 60.h),
                            RoleButton(
                              onPressed: () async {
                                bloc.saveRole(bloc.isUser);
                                Get.to(() => LoginScreen(isUser: bloc.isUser));
                              },
                            ),
                            Space(boxHeight: 20.h),
                          ],
                        );
                      })),
            ),
          ),
        ],
      ),
    );
  }
}

class RoleBackgroundWidget extends StatelessWidget {
  const RoleBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          clipImage,
          height: 300.h,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: screenHeight - 300.h,
        )
      ],
    );
  }
}


// class RoleScreen extends StatelessWidget {
//   const RoleScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (BuildContext context) => RoleCubit(),
//         child:
// BlocConsumer<RoleCubit, RoleState>(
//             listener: (context, state) {},
//             builder: (context, state) {
//               final bloc = RoleCubit.get(context);
//               return Scaffold(
//                 // appBar: DefaultAppBar(title: tr("login"), isBack: false),
//                 body: BackgroundImage(
//                   child: SizedBox(
//                     width: screenWidth,
//                     height: screenHeight,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 80, bottom: 20),
//                           child: Text(
//                             tr("login"),
//                             style: TextStyles.appBarStyle,
//                           ),
//                         ),
//                         SidePadding(
//                           sidePadding: 50,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 tr("welcome"),
//                                 style: TextStyles.headerStyle,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Space(
//                           boxHeight: 80,
//                         ),
//                         RoleChoice(
//                           userTap: () => bloc.changeRole(true),
//                           providerTap: () => bloc.changeRole(false),
//                           isUser: bloc.isUser,
//                         ),
//                         const Space(
//                           boxHeight: 100,
//                         ),
//                         RoleButton(
//                           onPressed: () async {
//                             bloc.saveRole(bloc.isUser);
//                             Get.to(() => LoginScreen(isUser: bloc.isUser));
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }));
//   }
// }

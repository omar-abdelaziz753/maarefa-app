import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../../bloc/auth/provider/auth_provider_cubit.dart';
import '../../../../model/provider/provider/provider_model.dart';
import '../../../../repository/provider/auth_provider/auth_provider_repository.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';

class CvScreen extends StatelessWidget {
  final Provider data;
  const CvScreen({super.key, required this.data});

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
                appBar: DefaultAppBar(title: tr("cv_url")),
                body: SidePadding(
                  sidePadding: 30,
                  child: ListView(
                    children: [
                      Text(
                        tr("cv"),
                        style: TextStyles.introStyle.copyWith(
                            color: black, fontWeight: FontWeight.bold),
                      ),
                      const Space(
                        boxHeight: 10,
                      ),
                      Text(
                        tr("upload_cv"),
                        style: TextStyles.hintStyle,
                      ),
                      const Space(
                        boxHeight: 10,
                      ),
                      InkWell(
                        onTap: () => bloc.pickCV(),
                        child: Card(
                          color: profileColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(terms,
                                    height: 130.h,
                                    width: 100.w,
                                    fit: BoxFit.contain),
                                const Space(
                                  boxHeight: 30,
                                ),
                                Text(
                                    bloc.cvFile != null
                                        ? bloc.cvFile!.path
                                            .toString()
                                            .split('/')
                                            .last
                                        : data.cvPath
                                            .toString()
                                            .split('/')
                                            .last,
                                    textAlign: TextAlign.center,
                                    style: TextStyles.appBarStyle
                                        .copyWith(color: black, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const Space(
                      //   boxHeight: 20,
                      // ),
                      // Text(
                      //   tr("link"),
                      //   style: TextStyles.introStyle
                      //       .copyWith(color: black, fontWeight: FontWeight.bold),
                      // ),
                      // const Space(
                      //   boxHeight: 10,
                      // ),
                      // Text(
                      //   tr("add_link"),
                      //   style: TextStyles.hintStyle,
                      // ),
                      // const Space(
                      //   boxHeight: 10,
                      // ),
                      // Container(
                      //   width: screenWidth,
                      //   height: 70.h,
                      //   decoration: BoxDecoration(
                      //     color: white,
                      //     borderRadius: BorderRadius.circular(10.r),
                      //     border: Border.all(
                      //       color: profileColor,
                      //       width: 1,
                      //     ),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Image.asset(
                      //         linkIcon,
                      //         width: 70.w,
                      //       ),
                      //       const VerticalDivider(
                      //         thickness: 1,
                      //         color: profileColor,
                      //       ),
                      //       Text(
                      //         "Mohtawa-drive.com",
                      //         style: TextStyles.appBarStyle
                      //             .copyWith(color: black, fontSize: 16),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Space(
                        boxHeight: screenHeight / 4,
                      ),
                      MasterLoadButton(
                        buttonController: bloc.authController,
                        buttonText: tr("update_data"),
                        onPressed: () => bloc.editCV(),
                      ),
                      const Space(
                        boxHeight: 10,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

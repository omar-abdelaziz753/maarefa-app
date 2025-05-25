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
import '../../../../repository/provider/auth_provider/auth_provider_repository.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';

class AddCertificateScreen extends StatelessWidget {
  const AddCertificateScreen({super.key});

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
                appBar: DefaultAppBar(title: tr("certificate")),
                body: SidePadding(
                  sidePadding: 30,
                  child: ListView(
                    children: [
                      Text(
                        tr("certificate"),
                        style: TextStyles.introStyle.copyWith(
                            color: black, fontWeight: FontWeight.bold),
                      ),
                      const Space(
                        boxHeight: 10,
                      ),
                      Text(
                        tr("upload_certificate"),
                        style: TextStyles.hintStyle,
                      ),
                      const Space(
                        boxHeight: 10,
                      ),
                      InkWell(
                        onTap: () => bloc.pickCertificate(),
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
                                    bloc.certificateFile != null
                                        ? bloc.certificateFile!.path
                                            .toString()
                                            .split('/')
                                            .last
                                        : tr("click_certificate"),
                                    textAlign: TextAlign.center,
                                    style: TextStyles.appBarStyle
                                        .copyWith(color: black, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Space(
                        boxHeight: screenHeight / 4,
                      ),
                      MasterLoadButton(
                        buttonController: bloc.authController,
                        buttonText: tr("_data"),
                        onPressed: () => bloc.editCertificate(),
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

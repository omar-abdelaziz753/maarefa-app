import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../../bloc/profile/provider/provider_cubit.dart';
import '../../../../model/provider/provider/provider_model.dart';
import '../../../../repository/user/edit_profile/user_repository.dart';
import '../../../../res/drawable/icon/icons.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';
import '../../../../widget/textfield/master/master_textfield.dart';

class AboutYouScreen extends StatelessWidget {
  final Provider data;
  const AboutYouScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            ProviderCubit(UserRepository())..getInitBio(data),
        child: BlocConsumer<ProviderCubit, ProviderState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = ProviderCubit.get(context);
              return Scaffold(
                appBar: DefaultAppBar(
                  title: tr("about_provider"),
                ),
                body: SidePadding(
                  sidePadding: 30,
                  child: ListView(
                    children: [
                      MasterTextField(
                        controller: bloc.bio,
                        //sidePadding: 35,
                        hintText: tr("about"),
                        prefixIcon: emojiIcon,
                        maxLines: 5,
                        minLines: 5,
                        fieldHeight: 210,
                        errorText: bloc.validators[0],
                        onChanged: (val) => bloc.validate(val, 0, false),
                      ),
                      const Space(
                        boxHeight: 75,
                      ),
                      MasterLoadButton(
                        buttonController: bloc.controller,
                        buttonText: tr("updating_data"),
                        onPressed: () => bloc.editBio(),
                      ),
                      const Space(
                        boxHeight: 50,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

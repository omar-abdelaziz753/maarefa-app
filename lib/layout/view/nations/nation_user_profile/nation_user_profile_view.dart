import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/model/common/cities/city_model.dart';

import '../../../../bloc/nations/nations_cubit.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/profile/provider/provider_profile_body.dart';
import '../../../../widget/profile/user/user_profile_body.dart';

class UserProfileNationsView extends StatelessWidget {
  final List<CityModel> cities;
  final dynamic user;
  final bool isUser;
  const UserProfileNationsView(
      {super.key,
      required this.cities,
      required this.user,
      required this.isUser});
  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<NationsCubit, NationsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<NationsCubit, NationsState>(
            builder: (context, state) {
          if (state is AuthNationLoadedState) {
            final data = (state).data;
            return profileView(context, data);
          } else if (state is NationsLoadErrorState) {
            return const ErrorPage();
          } else {
            return const Loading();
          }
        });
      },
    );
  }

  profileView(context, data) {
    return isUser
        ? UserProfileBody(
            cities: cities,
            nations: data,
            user: user,
          )
        : ProviderProfileBody(
            cities: cities,
            nations: data,
            user: user,
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/bloc/cities/cities_cubit.dart';
import 'package:my_academy/widget/loader/loader.dart';

import '../../../../widget/error/page/error_page.dart';
import '../../nations/nation_user_profile/nation_user_profile_view.dart';

class UserProfileCitiesView extends StatelessWidget {
  final dynamic user;
  final bool isUser;
  const UserProfileCitiesView(
      {super.key, required this.user, required this.isUser});

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<CitiesCubit, CitiesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<CitiesCubit, CitiesState>(
              builder: (context, state) {
            if (state is AuthCityLoadedState) {
              final data = (state).data;
              return UserProfileNationsView(
                cities: data!,
                user: user,
                isUser: isUser,
              );
            } else if (state is CitiesLoadErrorState) {
              return const ErrorPage();
            } else {
              return const Loading();
            }
          });
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/nations/nations_cubit.dart';
import '../../../../bloc/splash/splash_cubit.dart';
import '../../../../model/common/cities/city_model.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';

class SplashNationsView extends StatelessWidget {
  final List<CityModel> cities;
  const SplashNationsView({super.key, required this.cities});
  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<NationsCubit, NationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<NationsCubit, NationsState>(
              builder: (context, state) {
            if (state is AuthNationLoadedState) {
              final data = (state).data;
              return splashView(context, data);
            } else if (state is NationsLoadErrorState) {
              return const ErrorPage();
            } else {
              return const Loading();
            }
          });
        });
  }

  splashView(context, data) {
    return BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const SizedBox();
        });
  }
}

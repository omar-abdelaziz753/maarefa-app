import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cities/cities_cubit.dart';
import '../../../../bloc/nations/nations_cubit.dart';
import '../../../../bloc/splash/splash_cubit.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../nations/nation_splash/splash_nations_view.dart';

class SplashCitiesView extends StatefulWidget {
  const SplashCitiesView({super.key});

  @override
  State<SplashCitiesView> createState() => _SplashCitiesViewState();
}

class _SplashCitiesViewState extends State<SplashCitiesView> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().startApp();
    context.read<CitiesCubit>().getCitiesInSplash();
    context.read<NationsCubit>().getNationsInSplash();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<CitiesCubit, CitiesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<CitiesCubit, CitiesState>(
              builder: (context, state) {
            if (state is AuthCityLoadedState) {
              final data = (state).data;
              return SplashNationsView(
                cities: data!,
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

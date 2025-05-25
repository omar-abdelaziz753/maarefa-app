import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/bloc/cities/cities_cubit.dart';
import 'package:my_academy/widget/loader/loader.dart';

import '../../../../widget/error/page/error_page.dart';
import '../../nations/nations_provider/provider_nation_view.dart';

class ProviderCitiesView extends StatelessWidget {
  const ProviderCitiesView({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<CitiesCubit, CitiesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<CitiesCubit, CitiesState>(
              builder: (context, state) {
            if (state is AuthCityLoadedState) {
              final data = (state).data;
              return ProviderNationsView(
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

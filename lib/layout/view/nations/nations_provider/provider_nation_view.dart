import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/model/common/cities/city_model.dart';

import '../../../../bloc/nations/nations_cubit.dart';
import '../../../../widget/auth/provider_register_body/provider_register_body.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';

class ProviderNationsView extends StatelessWidget {
  final List<CityModel> cities;
  const ProviderNationsView({super.key, required this.cities});
  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<NationsCubit, NationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<NationsCubit, NationsState>(
              builder: (context, state) {
            if (state is AuthNationLoadedState) {
              final data = (state).data;
              return authView(context, data);
            } else if (state is NationsLoadErrorState) {
              return const ErrorPage();
            } else {
              return const Loading();
            }
          });
        });
  }

  authView(context, data) {
    return ProviderRegisterBody(
      cities: cities,
      nations: data,
    );
  }
}

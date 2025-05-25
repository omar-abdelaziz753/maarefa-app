import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/provider_screens/add_contant/side_content_screen.dart';
import 'package:my_academy/layout/view/connectivity/connectivity_view.dart';
import 'package:my_academy/widget/buttons/filter/filter_button.dart';

import '../../../../bloc/check_provider/cubit/check_provider_cubit.dart';
import '../../../../widget/alert/alert_messege.dart';
import '../../../view/home/provider/provider_home_view.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: BlocProvider(
          create: (context) => CheckProviderCubit()..fCheckProvider(),
          child: BlocBuilder<CheckProviderCubit, CheckProviderState>(
            builder: (context, state) {
              if (state is! CheckProviderSuccess) {
                return const SizedBox();
              }

              return FilterButton(
                  isAdd: true,
                  onTap: !state.canAdd
                      ? () => showDialog(
                          context: Get.context!,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const ProviderSimpleAlert();
                          })
                      : () => Get.to(() => const SideContentScreen()));
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: const ConnectivityView(child: ProviderHomeView()),
    );
  }
}

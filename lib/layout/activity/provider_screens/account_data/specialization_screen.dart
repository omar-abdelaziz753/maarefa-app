import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../model/provider/provider/provider_model.dart';
import '../../../view/connectivity/connectivity_view.dart';
import '../../../view/specialization/specialization_profile/specialization_profile_view.dart';

class SpecializationScreen extends StatelessWidget {
  final Provider data;
  const SpecializationScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("specialty")),
      body: ConnectivityView(
          child: SpecializationProfileView(
        data: data,
      )),
    );
  }
}

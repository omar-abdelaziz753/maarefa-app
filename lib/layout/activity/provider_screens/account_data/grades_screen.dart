import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/layout/view/grades/grades_profile/grades_profile_view.dart';

import '../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../model/provider/provider/provider_model.dart';
import '../../../view/connectivity/connectivity_view.dart';

class GradesScreen extends StatelessWidget {
  final Provider data;
  const GradesScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("grades")),
      body: ConnectivityView(
        child: GradesProfileView(data: data),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/layout/view/provider_courses/provider_courses_view.dart';

import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../view/connectivity/connectivity_view.dart';

class ProviderCourseScreen extends StatelessWidget {
  const ProviderCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("t_courses")),
      body: ConnectivityView(child: ProviderCourseView()),
    );
  }
}

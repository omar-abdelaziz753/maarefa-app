import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../view/connectivity/connectivity_view.dart';
import '../../../view/provider_lessons/provider_lessons_view.dart';

class ProviderSubjectScreen extends StatelessWidget {
  const ProviderSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("courses_offered")),
      body: const ConnectivityView(child: ProviderLessonView()),
    );
  }
}

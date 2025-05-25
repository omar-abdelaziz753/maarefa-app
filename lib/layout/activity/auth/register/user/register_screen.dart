import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/layout/view/cities/cities_user/cities_user_view.dart';

import '../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("register"),centerTitle: false),
      body: const UserCitiesView(),
    );
  }
}

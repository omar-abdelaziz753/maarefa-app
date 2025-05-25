import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/view/connectivity/connectivity_view.dart';

import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../view/course/course_view.dart';
import '../main/main_screen.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const MainScreen());
        return true;
      },
      child: Scaffold(
        appBar: DefaultAppBar(
            title: tr("specifications"),
            backPressed: () => Get.to(() => const MainScreen())),
        body: const ConnectivityView(child: CourseView()),
      ),
    );
  }
}

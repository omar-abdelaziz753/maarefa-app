import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/view/connectivity/connectivity_view.dart';
import 'package:my_academy/layout/view/specialization/specialization_view.dart';

import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/buttons/filter/filter_button.dart';
import '../course/course_screen.dart';
import '../filter/course_filter_screen.dart';

class SpecificationScreen extends StatelessWidget {
  const SpecificationScreen({super.key, this.title, this.id, this.filter});
  final String? title;
  final int? id;
  final Map<String, dynamic>? filter;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(() => const CourseScreen());
        return true;
      },
      child: Scaffold(
        appBar: DefaultAppBar(
            title: title ?? "",
            backPressed: () => Get.to(() => const CourseScreen())),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FilterButton(onTap: () {
          Get.to(() => CourseFilterScreen(
                type: 'course',
                title: title ?? "",
                id: id!,
                filter: filter??{},
              ));
        }),
        body: ConnectivityView(
            child: SpecializationView(
          title: title,
          id: id,
          filter: filter??{},
        )),
      ),
    );
  }
}

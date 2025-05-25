import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';

import '../../../view/filter/course/course_filter_view.dart';

class CourseFilterScreen extends StatelessWidget {
  final String type, title;
  final int id;
  final int? yearId;
  final Map<String, dynamic>? filter;

  const CourseFilterScreen({
    super.key,
    required this.type,
    required this.title,
    required this.id,
    this.yearId,
    this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("filter")),
      body: CourseFilterView(
        id: id,
        title: title,
        type: type,
        filter: filter ?? {},
        yearId: yearId,
      ),
    );
  }
}

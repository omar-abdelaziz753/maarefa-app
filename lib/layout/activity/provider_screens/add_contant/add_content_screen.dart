import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../model/common/lessons/lesson_model.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../view/connectivity/connectivity_view.dart';
import '../../../view/grades/grade_lesson_provider/grade_lesson_view.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({super.key, this.lesson});
  final LessonDetails? lesson;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("add_content")),
      body: ConnectivityView(
        child: GradesLessonView(lesson: lesson),
      ),
    );
  }
}

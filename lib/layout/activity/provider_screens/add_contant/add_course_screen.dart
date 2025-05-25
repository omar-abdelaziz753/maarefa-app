import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../bloc/content/content_cubit.dart';
import '../../../../model/common/courses/course_details/course_details_model.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../view/specialization/specialization_course_provider/specialization_course_provider.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key, this.courseDetailsMode});
  final CourseDetailsModel? courseDetailsMode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<ContentCubit>(context),
        child: BlocConsumer<ContentCubit, ContentState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = context.watch<ContentCubit>();
              return WillPopScope(
                onWillPop: () async {
                  bloc.clearCourseData();
                  // Get.offAll();
                  return true;
                },
                child: Scaffold(
                  appBar: DefaultAppBar(
                      title: tr("add_content"),
                      backPressed: () {
                        bloc.clearCourseData();
                        Get.back();
                      }),
                  body: SpecializationCourseView(
                    courseDetailsMode: courseDetailsMode,
                  ),
                ),
              );
            }));
  }
}

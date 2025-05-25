import 'package:flutter/material.dart';
import '../../../view/provider_course_details/provider_course_details_view.dart';

class CourseDetails extends StatelessWidget {
  final int? id;
  const CourseDetails({
    super.key,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ProviderCourseDetailsView(
      id: id!,
      isUser: false,
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/course_subject/course_subject_cubit.dart';
import '../../../../repository/user/courses/courses_repository.dart';
import '../../../../widget/headers/course_subject/course_subject_header.dart';
import '../../../view/all_user_requests/requests_subject_view.dart';
import '../../../view/connectivity/connectivity_view.dart';

class MyRequestsScreen extends StatelessWidget {
  const MyRequestsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ConnectivityView(
      child: BlocProvider(
          create: (BuildContext context) =>
              CourseSubjectCubit(CoursesRepository()),
          child: BlocConsumer<CourseSubjectCubit, CourseSubjectState>(
              listener: (context, state) {},
              builder: (context, state) {
                final bloc = CourseSubjectCubit.get(context);
                return Scaffold(
                  // floatingActionButton: Padding(
                  //   padding: const EdgeInsets.only(bottom: 50.0),
                  //   child: FilterButton(onTap: () => showFilterAction(context)),
                  // ),
                  // floatingActionButtonLocation:
                  //     FloatingActionButtonLocation.startFloat,
                  body: Column(
                    children: [
                      CourseSubjectHeader(
                        courseTap: () => bloc.chooseCourseSubject(false),
                        subjectTap: () => bloc.chooseCourseSubject(true),
                        isSubject: bloc.isSubject,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: bloc.isSubject
                              ? RequestsSubjectView()
                              : Container()
                          // : RequestsCourseView(),
                          ),
                    ],
                  ),
                );
              })),
    );
  }
}

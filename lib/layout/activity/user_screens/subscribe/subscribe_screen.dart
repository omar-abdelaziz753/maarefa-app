import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/subscribe/subscribe_cubit.dart';
import '../../../../widget/buttons/filter/filter_button.dart';
import '../../../../widget/filter_sheet/filter_sheet.dart';
import '../../../../widget/headers/course_subject/course_subject_header.dart';
import '../../../view/subscribe/subscribe_course_view.dart';
import '../../../view/subscribe/subscribe_subject_view.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscribeCubit, SubscribeState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bloc = context.watch<SubscribeCubit>();
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: !bloc.isSubject
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FilterButton(
                        onTap: () => showFilterAction(context, 'course')),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FilterButton(onTap: () {
                      showFilterAction(context, 'lesson');
                    }),
                  ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body: Column(
            children: [
              CourseSubjectHeader(
                courseTap: () => bloc.chooseCourseSubject(false),
                subjectTap: () => bloc.chooseCourseSubject(true),
                isSubject: bloc.isSubject,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: bloc.isSubject
                      ? const SubscribeSubjectView()
                      : const SubscribeCourseView(),
                ),
              ),
              // const Space(
              //   boxHeight: 70,
              // ),
            ],
          ),
        );
      },
    );
  }
}

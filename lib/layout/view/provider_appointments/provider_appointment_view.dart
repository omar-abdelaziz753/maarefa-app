import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/bloc/provider_appointments/provider_appointments_cubit.dart';
import 'package:my_academy/layout/view/provider_appointments/provider_course_appointments.dart';
import 'package:my_academy/layout/view/provider_appointments/provider_lesson_appointments.dart';
import 'package:my_academy/widget/headers/course_subject/course_subject_header.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

class ProviderAppointments extends StatelessWidget {
  final String status;
  const ProviderAppointments({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ProviderAppointmentsCubit>(context),
      child: BlocConsumer<ProviderAppointmentsCubit, ProviderAppointmentsState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = ProviderAppointmentsCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  CourseSubjectHeader(
                    courseTap: () => bloc.chooseCourseSubject(false),
                    subjectTap: () => bloc.chooseCourseSubject(true),
                    isSubject: bloc.isSubject,
                  ),
                  bloc.isSubject
                      ? SidePadding(
                          sidePadding: 35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProviderAppointmentsSubjectView(
                                status: status,
                              ),
                            ],
                          ),
                        )
                      : SidePadding(
                          sidePadding: 35,
                          child: Column(
                            children: [
                              // SubjectAcademinScreen()
                              ProviderAppointmentsCourseView(
                                status: status,
                              )
                            ],
                          ),
                        ),
                  const Space(
                    boxHeight: 30,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

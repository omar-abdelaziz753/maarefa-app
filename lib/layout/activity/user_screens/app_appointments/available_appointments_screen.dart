import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bloc/groups/groups_cubit.dart';
import '../../../../model/common/courses/course_details/course_details_model.dart';
import '../../../../model/user/groups_courses/groups_courses_model.dart';
import '../../../../repository/user/groups_courses/groups_courses_repository.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/group_appointments/appointments_container.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';

class AvailableAppointments extends StatelessWidget {
  const AvailableAppointments(
      {super.key,
      required this.courseId,
      this.courseDetailsModel,
      this.isUser = true});
  final int? courseId;
  final CourseDetailsModel? courseDetailsModel;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: tr("available_appointments")),
        body: BlocProvider(
          create: (BuildContext context) =>
              GroupsCubit(GroupModelRepository())..getCourseGroups(courseId!),
          child: BlocConsumer<GroupsCubit, GroupsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GroupsLoaded) {
                return appointmentsView(
                    data: state.data, courseDetailsModel: courseDetailsModel!);
              } else if (state is GroupsError) {
                return const ErrorPage();
              }
              return const Loading();
            },
          ),
        ));
  }

  appointmentsView(
      {required List<GroupModel> data,
      required CourseDetailsModel courseDetailsModel}) {
    return SidePadding(
        sidePadding: 30,
        child: Column(
          children: [
            if (isUser)
              Text(tr("enroll_end_with_start"),
                  style: TextStyles.subTitleStyle
                      .copyWith(color: grey, fontSize: 16.sp)),
            const Space(
              boxHeight: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => SizedBox(
                        height: 370.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr("group_number", args: ["${index + 1}"]),
                              style: TextStyles.contentStyle
                                  .copyWith(color: black, fontSize: 16),
                            ),
                            const Space(
                              boxHeight: 10,
                            ),
                            AppointmentsContainer(
                                isUser: isUser,
                                data: data[index],
                                courseDetailsModel: courseDetailsModel),
                          ],
                        ),
                      )),
            ),
          ],
        ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/user_screens/trainer/trainer_screen.dart';
import 'package:my_academy/model/common/courses/course_details/course_details_model.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../../bloc/course_subject/course_subject_cubit.dart';
import '../../../../repository/user/courses/courses_repository.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../../card_view/course/course_card3.dart';
import '../../../card_view/course/show_course_details_card.dart';
import '../../../card_view/trainer_card/trainer_card.dart';
import '../../../view/connectivity/connectivity_view.dart';
import '../app_appointments/available_appointments_screen.dart';

class CourseRegistration extends StatelessWidget {
  final int id;
  final bool isUser;
  const CourseRegistration({
    super.key,
    required this.id,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Container(
      //   margin: EdgeInsets.symmetric(horizontal: 40.w,vertical: 15.h),
      //   child: MasterButton(
      //       onPressed: () {
      //         Get.to(()=>const AvailableAppointments());
      //       },
      //       buttonText: tr("register_course")),
      // ),
      body: ConnectivityView(
        child: BlocProvider(
          create: (BuildContext context) =>
              CourseSubjectCubit(CoursesRepository())..getCourseById(id),
          child: BlocConsumer<CourseSubjectCubit, CourseSubjectState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CourseDetailsLoadedState) {
                return courseRegistrationView(
                    courseDetailsModel: (state).data!);
              } else if (state is CourseErrorState) {
                return const ErrorPage();
              }
              return const Loading();
            },
          ),
        ),
      ),
    );
  }

  courseRegistrationView({
    required CourseDetailsModel courseDetailsModel,
  }) {
    return ListView(
      children: [
        CourseCard3(
          row: courseDetailsModel.attendanceType == 1 ? true : false,
          courseDetailsModel: courseDetailsModel,
          isBlue: courseDetailsModel.isBookmarked!,
        ),
        SidePadding(
          sidePadding: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Space(
                boxHeight: 20,
              ),
              ShowCourseDetailsCard(courseDetailsModel: courseDetailsModel),
              Space(boxHeight: 20.h),
              Text(
                tr("acquired_skills"),
                style: TextStyles.appBarStyle.copyWith(color: black),
              ),
              Space(boxHeight: 10.h),
              Wrap(
                children: List.generate(
                  courseDetailsModel.tags!.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                    child: ChoiceChip(
                        backgroundColor: white,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: textfieldColor),
                            borderRadius: BorderRadius.circular(25.r)),
                        onSelected: (t) {},
                        selectedColor: mainColor,
                        label: Text(
                          courseDetailsModel.tags![index].name!,
                          style: TextStyles.appBarStyle.copyWith(
                              color: black, fontWeight: FontWeight.bold),
                        ),
                        selected: false),
                  ),
                ),
              ),
              Space(boxHeight: 30.h),
              Text(
                tr("trainer"),
                style: TextStyles.appBarStyle.copyWith(color: black),
              ),
              Space(boxHeight: 10.h),
              GestureDetector(
                onTap: () => Get.to(() => TrainerScreen(
                      id: courseDetailsModel.provider!.id!,
                      isUser: isUser,
                    )),
                child: TrainerCard(
                  courseDetailsModel: courseDetailsModel,
                ),
              ),
              Space(boxHeight: 30.h),
              courseDetailsModel.isRequested == true
                  ? const SizedBox()
                  : MasterButton(
                      // buttonStyle: TextStyles.appBarStyle
                      //     .copyWith(color: mainColor),
                      onPressed: () {
                        Get.to(() => AvailableAppointments(
                            courseId: courseDetailsModel.id,
                            courseDetailsModel: courseDetailsModel));
                      },
                      buttonText: tr("available_appointments")),
              Space(boxHeight: 20.h),
            ],
          ),
        ),
      ],
    );
  }
}

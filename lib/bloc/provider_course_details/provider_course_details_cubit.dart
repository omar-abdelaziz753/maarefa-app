import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../layout/activity/provider_screens/main/main_screen.dart';
import '../../model/common/courses/course_details/course_details_model.dart';
import '../../repository/provider/courses/courses_repository.dart';

part 'provider_course_details_state.dart';

class ProviderCourseDetailsCubit extends Cubit<ProviderCourseDetailsState> {
  ProviderCourseDetailsCubit(this.coursesRepository)
      : super(ProviderCourseDetailsInitial());
  CoursesRepository coursesRepository;
  static ProviderCourseDetailsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  getCourseById(int id) {
    coursesRepository.courseDetails(id).then((value) {
      emit(CourseDetailsLoadedState(data: value.data));
    });
  }

  deleteCourse(int id) {
    coursesRepository.deleteCourse(id).then((value) {
      Get.offAll(() => const ProviderMainScreen());
      emit(CourseDeleteState());
    });
  }
}

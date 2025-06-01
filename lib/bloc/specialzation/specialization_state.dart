import 'package:my_academy/model/common/specializations/lessions_model.dart';

import '../../model/common/courses/course_details/course_details_model.dart';
import '../../model/common/subjects/subjects_model.dart';

abstract class SpecializationState {}

class SpecializationInitial extends SpecializationState {}

class SpecializationLoadingState extends SpecializationState {}

class SpecializationLoadedState extends SpecializationState {
  List<Specialization> data;
  List<LessonData> lessonData;

  SpecializationLoadedState({required this.data, required this.lessonData});
}

class SpecializationErrorState extends SpecializationState {}

class InitSpecializationState extends SpecializationState {}

class InitProviderSpecializationState extends SpecializationState {}

class SameSpecializationState extends SpecializationState {}

class NewSpecializationState extends SpecializationState {}

class ChooseSpecializationState extends SpecializationState {}

class EditSpecializationState extends SpecializationState {}

class SubjectLoadedState extends SpecializationState {
  List<SubjectModel> data;

  SubjectLoadedState({required this.data});
}

class SubjectErrorState extends SpecializationState {}

class LessonLoadedState extends SpecializationState {
  List<LessonData> data;

  LessonLoadedState({required this.data});
}

class LessonErrorState extends SpecializationState {}
class ContentUpdatedState extends SpecializationState {}

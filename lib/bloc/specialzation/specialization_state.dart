import '../../model/common/courses/course_details/course_details_model.dart';
import '../../model/common/subjects/subjects_model.dart';

abstract class SpecializationState {}

class SpecializationInitial extends SpecializationState {}

class SpecializationLoadingState extends SpecializationState {}

class SpecializationLoadedState extends SpecializationState {
  List<Specialization> data;

  SpecializationLoadedState({required this.data});
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

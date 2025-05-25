part of 'provider_appointments_cubit.dart';

@immutable
abstract class ProviderAppointmentsState {}

class ProviderAppointmentsInitial extends ProviderAppointmentsState {}

class ChooseSubjectState extends ProviderAppointmentsState {}

class ChooseCourseState extends ProviderAppointmentsState {}

class ProviderLessonsLoadedState extends ProviderAppointmentsState {
  final List<LessonDetails> data;

  ProviderLessonsLoadedState(this.data);
}

class ProviderLessonsLoadingState extends ProviderAppointmentsState {
  final List<LessonDetails> data;
  final bool isFirstFetch;

  ProviderLessonsLoadingState(this.data, {this.isFirstFetch = false});
}

class ProviderCourseLoadingState extends ProviderAppointmentsState {
  final List<CourseModel> oldRequests;
  final bool isFirstFetch;

  ProviderCourseLoadingState(this.oldRequests, {this.isFirstFetch = false});
}

class ProviderCourseLoadedState extends ProviderAppointmentsState {
  final List<CourseModel> data;
  ProviderCourseLoadedState({required this.data});
}

class SameFilterState extends ProviderAppointmentsState {}

class DifferrentFilterState extends ProviderAppointmentsState {}

class ChangeStatusState extends ProviderAppointmentsState {}

class EmptyFilterState extends ProviderAppointmentsState {}

class CourseCommingState extends ProviderAppointmentsState {}

class CourseFinishedState extends ProviderAppointmentsState {}

class CourseState extends ProviderAppointmentsState {}

class LessonFinishedState extends ProviderAppointmentsState {}

class LessonCommingState extends ProviderAppointmentsState {}

class LessonState extends ProviderAppointmentsState {}

class InitialLessonState extends ProviderAppointmentsState {}

class InitialCourseState extends ProviderAppointmentsState {}

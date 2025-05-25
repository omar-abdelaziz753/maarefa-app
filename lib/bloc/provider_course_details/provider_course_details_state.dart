part of 'provider_course_details_cubit.dart';

@immutable
abstract class ProviderCourseDetailsState {}

class ProviderCourseDetailsInitial extends ProviderCourseDetailsState {}

class CourseDeleteState extends ProviderCourseDetailsState {}

class CourseDetailsErrorState extends ProviderCourseDetailsState {}

class CourseDetailsLoadedState extends ProviderCourseDetailsState {
  final CourseDetailsModel data;
  CourseDetailsLoadedState({required this.data});
}

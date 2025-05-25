part of 'course_subject_cubit.dart';

abstract class CourseSubjectState {}

class CourseSubjectInitial extends CourseSubjectState {}

class CourseTypeInitial extends CourseSubjectState {}

class CourseTypeChange extends CourseSubjectState {}

class ChooseSubjectState extends CourseSubjectState {}

class CourseSubjectLoadingState extends CourseSubjectState {}

class CourseDetailsLoadedState extends CourseSubjectState {
  CourseDetailsModel? data;

  CourseDetailsLoadedState({this.data});
}

class CourseLoadedState extends CourseSubjectState {
  List<CourseDetailsModel> data;
  CourseLoadedState({required this.data});
}

class CourseErrorState extends CourseSubjectState {}

class ChooseCourseState extends CourseSubjectState {}

class InitBookmarkState extends CourseSubjectState {}

class RemoveBookmarkState extends CourseSubjectState {}

class AddBookmarkState extends CourseSubjectState {}

class BookmarkState extends CourseSubjectState {}

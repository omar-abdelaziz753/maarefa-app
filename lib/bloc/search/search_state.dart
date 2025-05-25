part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  List<SearchCourse>? courses;
  List<SearchLesson>? lessons;

  SearchLoaded({this.courses, this.lessons});
}

class SearchError extends SearchState {}

class BookmarkState extends SearchState {}

class AddBookmarkState extends SearchState {}

class RemoveBookmarkState extends SearchState {}

class InitBookmarkState extends SearchState {}

class InitCoursesState extends SearchState {}

class InitLessonsState extends SearchState {}

part of 'bookmark_cubit.dart';

abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkCoursesLoadingState extends BookmarkState {}

class BookmarkSubjectsLoadingState extends BookmarkState {}

class BookmarkCoursesLoadedState extends BookmarkState {
  List<BookmarkCoursesModel> data;
  BookmarkCoursesLoadedState({required this.data});
}

class BookmarkLessonsLoadedState extends BookmarkState {
  List<LessonDetails> data;
  BookmarkLessonsLoadedState({required this.data});
}

class BookmarkAddCoursesState extends BookmarkState {
  List<BookmarkCoursesModel> data;
  BookmarkAddCoursesState({required this.data});
}

class BookmarkAddLessonsState extends BookmarkState {
  List<LessonDetails> data;
  BookmarkAddLessonsState({required this.data});
}

class BookmarkCoursesErrorState extends BookmarkState {}

class BookmarkLessonsErrorState extends BookmarkState {}

class InitBookmarkState extends BookmarkState {}

class RemoveBookmarkState extends BookmarkState {}

part of 'lessons_cubit.dart';

abstract class LessonsState {}

class LessonsInitial extends LessonsState {}

class LessonsLoadingState extends LessonsInitial {
  final List<LessonDetails> oldLessons;
  final bool isFirstFetch;

  LessonsLoadingState(this.oldLessons, {this.isFirstFetch = false});
}

class LessonsLoadedState extends LessonsState {
  final List<LessonDetails> lessons;

  LessonsLoadedState(this.lessons);
}

class LessonsByIdLoadedState extends LessonsState {
  List<LessonDetails>? lessons;

  LessonsByIdLoadedState(this.lessons);
}

class LessonDetailsLoadedState extends LessonsState {
  LessonDetails data;
  LessonDetailsLoadedState({required this.data});
}

class LessonsErrorState extends LessonsState {}

class ChangeSelectedSubjectCardState extends LessonsState {}

class SameSelectedSubjectCardState extends LessonsState {}

class DifferrentSelectedSubjectCardState extends LessonsState {}

class InitBookmarkState extends LessonsState {}

class InitialLessonState extends LessonsState {}

class RemoveBookmarkState extends LessonsState {}

class AddBookmarkState extends LessonsState {}

class BookmarkState extends LessonsState {}

class SameSortState extends LessonsState {}

class DifferentSortState extends LessonsState {}

class ChangeSortState extends LessonsState {}

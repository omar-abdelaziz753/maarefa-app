part of 'lesson_details_provider_cubit.dart';

@immutable
abstract class LessonDetailsProviderState {}

class LessonDetailsProviderInitial extends LessonDetailsProviderState {}

class LessonDetailsLoadedState extends LessonDetailsProviderState {
  final LessonDetails? data;
  LessonDetailsLoadedState({this.data});
}

class LessonDetailsErrorState extends LessonDetailsProviderState {}

class LessonDeleteState extends LessonDetailsProviderState {}

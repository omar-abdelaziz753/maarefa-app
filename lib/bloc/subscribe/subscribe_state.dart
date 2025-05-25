part of 'subscribe_cubit.dart';

@immutable
abstract class SubscribeState {}

class SubscribeInitial extends SubscribeState {}

class ChooseSubjectState extends SubscribeState {}

class ChooseCourseState extends SubscribeState {}

class CourseSubscriptionLoadedState extends SubscribeState {
  final SubscribeCourseModel data;

  CourseSubscriptionLoadedState({required this.data});
}

class SubjectSubscriptionLoadedState extends SubscribeState {
  final SubscribeSubjectModel data;

  SubjectSubscriptionLoadedState({required this.data});
}

class CourseSubscriptionLoadErrorState extends SubscribeState {}

class SubjectSubscriptionLoadErrorState extends SubscribeState {}

class ChangeStatusState extends SubscribeState {}

class EmptyFilterState extends SubscribeState {}

class FilteredCoursesLoadedState extends SubscribeState {
  final SubscribeCourseModel data;

  FilteredCoursesLoadedState({required this.data});
}

class FilteredLessonsLoadedState extends SubscribeState {
  final SubscribeSubjectModel data;

  FilteredLessonsLoadedState({required this.data});
}

class SubscriptionLessonCommingState extends SubscribeState {}

class SubscriptionLessonFinishedState extends SubscribeState {}

class SubscriptionLessonState extends SubscribeState {}

class SameFilterState extends SubscribeState {}

class DifferrentFilterState extends SubscribeState {}

class LoadingState extends SubscribeState {}

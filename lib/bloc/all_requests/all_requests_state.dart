part of 'all_requests_cubit.dart';

@immutable
abstract class AllRequestsState {}

class AllRequestsInitial extends AllRequestsState {}


class CourseRequestsLoadedState extends AllRequestsState {
  final List<RequestDetailsModel>? data;
  CourseRequestsLoadedState({this.data});
}

class LessonRequestsLoadedState extends AllRequestsState {
  final List<RequestModel>? data;
  // final RequestModel? data;
  LessonRequestsLoadedState({this.data});
}

class CourseRequestsLoadErrorState extends AllRequestsState{}

class LessonRequestsLoadErrorState extends AllRequestsState{}



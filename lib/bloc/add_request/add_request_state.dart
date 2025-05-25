part of 'add_request_cubit.dart';

abstract class AddRequestState {}

class AddRequestInitial extends AddRequestState {}

class AddRequestLoading extends AddRequestState {}

class ValidateRequestLoading extends AddRequestState {}

class AddRequestLoaded extends AddRequestState {}

class ValidateRequest extends AddRequestState {}

class IsSelectedChipState extends AddRequestState {}

class AddRequestError extends AddRequestState {}

class AddCourseRequestState extends AddRequestState {}

class SetDateState extends AddRequestState {}

class SameDayState extends AddRequestState {}

class DifferentDayState extends AddRequestState {}

class GetTimeState extends AddRequestState {}

class ShowTimeState extends AddRequestState {}

class HideTimeState extends AddRequestState {}

class InitTimeState extends AddRequestState {}

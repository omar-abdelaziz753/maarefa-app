// part of 'home_cubit.dart';
//
// @immutable
// sealed class HomeState {}
//
// final class HomeInitial extends HomeState {}
//
// /// Get All Teachers States
// final class GetAllTeachersLoadingState extends HomeState {}
//
// final class GetAllTeachersSuccessState extends HomeState {}
//
// final class GetAllTeachersLoadingMoreState extends HomeState {}
//
// final class GetAllTeachersErrorState extends HomeState {
//   final String? errorMessage;
//
//   GetAllTeachersErrorState({this.errorMessage});
// }

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllTeachersLoadingState extends HomeState {}

class GetAllTeachersSuccessState extends HomeState {}

class GetAllTeachersErrorState extends HomeState {
  final String errorMessage;

  GetAllTeachersErrorState({required this.errorMessage});
}

class GetAllTeachersLoadingMoreState extends HomeState {}

/// Get All Specializations States
class GetAllSpecializationsLoadingState extends HomeState {}

class GetAllSpecializationsSuccessState extends HomeState {}

class GetAllSpecializationsErrorState extends HomeState {
  final String errorMessage;

  GetAllSpecializationsErrorState({required this.errorMessage});
}

/// Get Teacher Details States
class GetTeacherDetailsLoadingState extends HomeState {}

class GetTeacherDetailsSuccessState extends HomeState {}

class GetTeacherDetailsErrorState extends HomeState {
  final String errorMessage;  // Add this line

  GetTeacherDetailsErrorState({required this.errorMessage});
}
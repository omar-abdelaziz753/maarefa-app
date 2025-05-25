part of 'subject_cubit.dart';

abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class ChangeSelectedSubjectCardState extends SubjectState {}

class SameSelectedSubjectCardState extends SubjectState {}

class SubjectLoadingState extends SubjectState {}

class SubjectLoadedState extends SubjectState {
  List<SubjectModel> subject;

  SubjectLoadedState({required this.subject});
}

class SubjectErrorState extends SubjectState {}

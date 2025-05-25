part of 'cv_hint_cubit.dart';

abstract class CvHintState extends Equatable {
  const CvHintState();

  @override
  List<Object> get props => [];
}

class CvHintInitial extends CvHintState {}

class CvHintSuccess extends CvHintState {
  final String note;

  const CvHintSuccess({required this.note});
}

class CvHintLoading extends CvHintState {}

class CvHintError extends CvHintState {
  const CvHintError({required this.message});
  final String message;
}

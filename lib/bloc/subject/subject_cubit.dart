import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/common/subjects/subjects_model.dart';
import '../../repository/common/subjects/subjects_repository.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial());

  SubjectsRepository subjectsRepository = SubjectsRepository();

  static SubjectCubit get(BuildContext context) => BlocProvider.of(context);

  getSubjects({required int yearId, required int stageId}) {
    emit(SubjectLoadingState());
    subjectsRepository
        .getSubjects(yearId: yearId, stageId: stageId)
        .then((value) {
      emit(SubjectLoadedState(subject: value.subject));
    });
  }
}

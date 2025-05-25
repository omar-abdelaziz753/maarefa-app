import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repository/static_pages/settings_repository.dart';

part 'cv_hint_state.dart';

class CvHintCubit extends Cubit<CvHintState> {
  CvHintCubit(this.settingsRepository) : super(CvHintInitial());
  final SettingsRepository settingsRepository;
  Future<void> fgetCvNote() async {
    emit(CvHintLoading());
    final failOrRes = await settingsRepository.getCvNote();
    failOrRes.fold((l) {
      emit(const CvHintError(message: ""));
    }, (r) {
      emit(CvHintSuccess(note: r));
    });
  }
}

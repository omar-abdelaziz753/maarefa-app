import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/model/common/nationalities/nationality_model.dart';

import '../../repository/common/nationalities/nationalities_repository.dart';

part 'nations_state.dart';

class NationsCubit extends Cubit<NationsState> {
  NationalitiesRepository nationsRepository;
  NationsCubit(this.nationsRepository) : super(NationsInitial());

  static NationsCubit get(BuildContext context) => BlocProvider.of(context);

  getNationsInSplash() {
    nationsRepository.getNationsInSplash().then((value) {
      emit(AuthNationLoadedState(data: value.data));
    });
  }

  getNations() {
    nationsRepository.getNations().then((value) {
      if (value == null) {
        getNationsInSplash();
        return;
      }
      emit(AuthNationLoadedState(data: value.data));
    });
  }
}

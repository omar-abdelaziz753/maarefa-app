import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/live/live_repository.dart';

part 'live_state.dart';

class LiveCubit extends Cubit<LiveState> {
  final LiveRepository liveRepository;
  LiveCubit(this.liveRepository) : super(LiveInitial());
  static LiveCubit get(BuildContext context) => BlocProvider.of(context);

  bool isLoad = false;

  enterLive(bool isBroadcaster, int id, String type, {int? timeId}) {
    isLoad = true;
    if (isBroadcaster) {
      Map<String, dynamic> data = {"type": type, "id": id, "time_id": timeId};
      liveRepository.enterLive(data, isBroadcaster).then((v) {
        isLoad = false;
      });
      isLoad = false;
      emit(EnterLiveState());
    } else {
      Map<String, dynamic> data = {"type": type, "id": id, "time_id": timeId};
      liveRepository.enterLive(data, isBroadcaster).then((v) {
        isLoad = false;
      });
      isLoad = false;
      emit(EnterLiveState());
    }
  }
}

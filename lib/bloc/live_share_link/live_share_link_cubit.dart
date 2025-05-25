import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/live/live_repository.dart';

part 'live_share_link_state.dart';

class LiveShareLinkCubit extends Cubit<LiveShareLinkState> {
  final LiveRepository liveRepository = LiveRepository();
  LiveShareLinkCubit() : super(LiveShareLinkInitial());
  static LiveShareLinkCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void getLink({required int id, required String type, int? timeId}) async {
    final params = {"type": type, "id": id, "time_id": timeId};
    emit(LiveShareLinkLoadingState());
    final result = await liveRepository.getNewShareLinkForLive(
      params,
    );
    result.fold(
      (failer) {
        emit(LiveShareLinkFailState());
      },
      (url) {
        emit(LiveShareLinkSuccessState(link: url));
      },
    );
  }

  @override
  void emit(LiveShareLinkState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}

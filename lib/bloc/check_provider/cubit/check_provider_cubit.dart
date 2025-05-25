import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_academy/service/network/dio/dio_service.dart';

part 'check_provider_state.dart';

class CheckProviderCubit extends Cubit<CheckProviderState> {
  CheckProviderCubit() : super(CheckProviderInitial());

  Future<void> fCheckProvider() async {
    bool canAdd = false;
    final response = await DioService().get("/provider/auth/check-status");
    response.fold(
      (l) {},
      (r) {
        canAdd = (r["data"]["status"] == 1);
      },
    );
    emit(CheckProviderSuccess(canAdd));
  }
}

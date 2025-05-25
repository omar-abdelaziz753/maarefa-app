import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/user/show_providers/show_providers_model.dart';
import '../../../../repository/user/show_providers/show_providers_repository.dart';

part 'provider_info_state.dart';

class ProviderInfoCubit extends Cubit<ProviderInfoState> {
  ProviderInfoCubit(this.showProviderRepository) : super(ProviderInfoInitial());
  static ProviderInfoCubit get(BuildContext context) =>
      BlocProvider.of(context);
  ShowProvidersRepository showProviderRepository;
  getProviderDetails(int id) {
    ShowProvidersRepository().showProviders(id).then((value) {
      emit(ProviderInfoLoaded(data: value));
    });
  }

  shareProvider(BuildContext context, int id) {
    showProviderRepository.getGroupDynamicLinks(context, id);
    emit(ShareProviderState());
  }

  goToProvider() {
    showProviderRepository.getLinkData();
    emit(GoToProviderState());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/repository/provider/home/home_repository.dart';

import '../../model/provider/home/home_db_response.dart';
import '../../model/slider/slider_model.dart';
import '../../model/slider/slider_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  getHome() {
    homeRepository.getProviderHome().then((value) {
      emit(HomeLoadedState(data: value));
    });
  }

  getCacheHome() {
    homeRepository.getCacheHome().then((value) {
      emit(HomeLoadedState(data: value));
    });
  }

  getSlider() {
    homeRepository.getSlider().then((value) {
      emit(SliderLoadedState(data: value));
    });
  }

  getCacheSlider() {
    homeRepository.getCacheSlider().then((value) {
      emit(SliderLoadedState(data: value));
    });
  }

  getOffers() {
    homeRepository.getOffers().then((value) {
      emit(OffersLoadedState(data: value.data));
    });
  }

  CurrentAction? userCureentAction;
  getClientHome() async {
    homeRepository.getClientHome().then((value) {
      userCureentAction = value.data.currentAction;
      getSlider();
      emit(HomeLoadedState(data: value));
    });
  }
}

part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final HomeDbResponse? data;
  HomeLoadedState({this.data});
}

class HomeLoadErrorState extends HomeState {}

class SliderLoadedState extends HomeState {
  final SliderDbResponse? data;
  SliderLoadedState({this.data});
}

class SliderErrorState extends HomeState {}

class OffersLoadedState extends HomeState {
  final List<SliderModel>? data;
  OffersLoadedState({this.data});
}

class OffersErrorState extends HomeState {}

part of 'cities_cubit.dart';

@immutable
abstract class CitiesState {}

class CitiesInitial extends CitiesState {}

class AuthCityLoadedState extends CitiesState {
  final List<CityModel>? data;
  AuthCityLoadedState({this.data});
}

class CitiesLoadErrorState extends CitiesState{}

class ChooseCityState extends CitiesState {}

class ChangeCityState extends CitiesState {}

class SameCityState extends CitiesState {}
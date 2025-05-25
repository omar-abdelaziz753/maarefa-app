part of 'nations_cubit.dart';

@immutable
abstract class NationsState {}

class NationsInitial extends NationsState {}

class AuthNationLoadedState extends NationsState {
  final List<NationalityModel>? data;
  AuthNationLoadedState({this.data});
}

class NationsLoadErrorState extends NationsState{}
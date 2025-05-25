part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class StartAppState extends SplashState {}
class UserUnauthorizedState extends SplashState {}

class UserLoggedState extends SplashState {}

class ChangeUserState extends SplashState {}
class SplashLoadedState extends SplashState {
  final List<CityModel>? data;
  SplashLoadedState({this.data});
}

class SplashErrorState extends SplashState {}

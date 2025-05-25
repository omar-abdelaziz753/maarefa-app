part of 'intro_cubit.dart';

@immutable
abstract class IntroState {}

class IntroInitial extends IntroState {}

class ChangeIntroState extends IntroState {}

class ChangeIntroScrollState extends IntroState {}

class StartAppState extends IntroState {}
// class IntroSeenState extends IntroState {}

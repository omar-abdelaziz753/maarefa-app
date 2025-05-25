part of 'static_screens_cubit.dart';

abstract class StaticScreensState {}

class StaticScreensInitial extends StaticScreensState {}

class TermsLoadingState extends StaticScreensState {}

class TermsLoadedState extends StaticScreensState {
  StaticScreensModel data;
  TermsLoadedState({required this.data});
}

class TermsErrorState extends StaticScreensState {}

class AboutUsLoadingState extends StaticScreensState {}

class AboutUsLoadedState extends StaticScreensState {
  StaticScreensModel data;
  AboutUsLoadedState({required this.data});
}

class AboutUsErrorState extends StaticScreensState {}

class PrivacyLoadingState extends StaticScreensState {}

class PrivacyLoadedState extends StaticScreensState {
  StaticScreensModel data;
  PrivacyLoadedState({required this.data});
}

class PrivacyErrorState extends StaticScreensState {}

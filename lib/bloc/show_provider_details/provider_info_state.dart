part of 'provider_info_cubit.dart';

@immutable
abstract class ProviderInfoState {}

class ProviderInfoInitial extends ProviderInfoState {}

class ProviderInfoLoaded extends ProviderInfoState {
  ProviderInfoLoaded({required this.data});
  final ShowProvidersModel data;
}

class ProviderInfoError extends ProviderInfoState {}

class ShareProviderState extends ProviderInfoState {}

class GoToProviderState extends ProviderInfoState {}

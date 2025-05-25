part of 'check_provider_cubit.dart';

abstract class CheckProviderState extends Equatable {
  const CheckProviderState();

  @override
  List<Object> get props => [];
}

class CheckProviderInitial extends CheckProviderState {}

class CheckProviderError extends CheckProviderState {}

class CheckProviderSuccess extends CheckProviderState {
  final bool canAdd;

  const CheckProviderSuccess(this.canAdd);
}

class CheckProviderLoading extends CheckProviderState {}

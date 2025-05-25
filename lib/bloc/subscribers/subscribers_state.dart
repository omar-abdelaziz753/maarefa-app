part of 'subscribers_cubit.dart';

abstract class SubscribersState extends Equatable {
  const SubscribersState();

  @override
  List<Object> get props => [];
}

class SubscribersInitial extends SubscribersState {}

class SubscribersLoadedState extends SubscribersState {
  final List<SubscribersModel> data;

  const SubscribersLoadedState({required this.data});
}

class SubscribersErrorState extends SubscribersState {}

class SendCertificateState extends SubscribersState {}

class InitSubscriberState extends SubscribersState {}

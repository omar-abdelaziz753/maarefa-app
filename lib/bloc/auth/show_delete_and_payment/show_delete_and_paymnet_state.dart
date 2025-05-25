part of 'show_delete_and_paymnet_cubit.dart';

abstract class ShowDeleteAndPaymnetState extends Equatable {
  const ShowDeleteAndPaymnetState();

  @override
  List<Object> get props => [];
}

class ShowDeleteAndPaymnetInitial extends ShowDeleteAndPaymnetState {}

class ShowDeleteAndPaymnetSuccess extends ShowDeleteAndPaymnetState {}

class ShowDeleteAndPaymnetLoading extends ShowDeleteAndPaymnetState {}

class ShowDeleteAndPaymnetError extends ShowDeleteAndPaymnetState {
  const ShowDeleteAndPaymnetError({required this.message});
  final String message;
}

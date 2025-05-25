part of 'add_to_wallet_cubit.dart';

@immutable
abstract class AddToWalletState {}

class AddToWalletInitial extends AddToWalletState {}

class WalletLoadedState extends AddToWalletState {
  // final UserModel? data;
  // WalletLoadedState({this.data});
}

class LoadingAddToWalletState extends AddToWalletState {}

class ErrorAddToWalletState extends AddToWalletState {}

class SetPaymentMethodState extends AddToWalletState {}

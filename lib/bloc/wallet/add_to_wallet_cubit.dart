import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/repository/user/wallet/add_to_wallet_repository.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../model/user/user/user_model.dart';

part 'add_to_wallet_state.dart';

class AddToWalletCubit extends Cubit<AddToWalletState> {
  AddToWalletCubit(this.walletRepository) : super(AddToWalletInitial());
  final WalletRepository walletRepository;
  final TextEditingController amountController = TextEditingController();
  RoundedLoadingButtonController loadController =
      RoundedLoadingButtonController();
  static AddToWalletCubit get(BuildContext context) => BlocProvider.of(context);

  UserModel? walletModel;
  int? payment;
  int? paymentId;

  addToWallet(String amount) {
    walletRepository.addToWallet(amount: amount, id: paymentId!).then((value) {
      loadController.reset();
    });
  }

  setPaymentMethod(int value, int paymentMethodId) {
    payment = value;
    paymentId = paymentMethodId;
    emit(SetPaymentMethodState());
  }
}

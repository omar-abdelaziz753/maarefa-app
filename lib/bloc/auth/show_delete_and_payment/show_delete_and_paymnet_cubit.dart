// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/provider/show_delete_payment/show_delte_payment_rep.dart';

part 'show_delete_and_paymnet_state.dart';

class ShowDeleteAndPaymnetCubit extends Cubit<ShowDeleteAndPaymnetState> {
  ShowDeleteAndPaymnetCubit({
    required this.showDeleteRepo,
  }) : super(ShowDeleteAndPaymnetInitial());
  final ShowDeleteRepo showDeleteRepo;
  bool showDeleteAccount = true;
  bool showPayment = false;
  Future<void> getDeleteStatus() async {
    emit(ShowDeleteAndPaymnetLoading());
    showDeleteAccount = await showDeleteRepo.getDeleteStatus();
    showPayment = !showDeleteAccount;
    emit(ShowDeleteAndPaymnetSuccess());
  }
}

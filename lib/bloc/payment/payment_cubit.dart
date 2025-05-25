import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitialState());
  static PaymentCubit get(BuildContext context) => BlocProvider.of(context);
  int value = 1;

  void setPayment(rangeValues){
    value = rangeValues;
    emit(PaymentInitialState());
  }


}

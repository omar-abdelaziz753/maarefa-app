import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../layout/activity/user_screens/main/main_screen.dart';
import '../../model/pay/pay_response.dart';
import '../../model/payment_method/payment_method_model/payment_method_model.dart';
import '../../repository/user/pay/pay_repository.dart';
import '../../widget/toast/toast.dart';

part 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  PayCubit() : super(PayInitial());
  PayRepository payRepository = PayRepository();
  static PayCubit get(BuildContext context) => BlocProvider.of(context);
  RoundedLoadingButtonController payController =
      RoundedLoadingButtonController();
  TextEditingController amount = TextEditingController();

  int value = 1;
  int? payment;
  int? paymentId;

  setPaymentMethod(int value, int paymentMethodId) {
    payment = value;
    paymentId = paymentMethodId;
    emit(SetPaymentMethod());
  }

  void setPayment(rangeValues) {
    value = rangeValues;
    emit(TypePayState());
  }

  getPay(int id) {
    payRepository.getPay(id).then((value) {
      emit(PayLoadedState(data: value.data));
    });
  }

  getPaymentMethod() {
    payRepository.getPaymentMethod().then((value) {
      emit(PaymentMethodLoadedState(data: value.data));
    });
  }

  pay({
    required int id,
    required BuildContext context,
  }) {
    Map<String, dynamic> data = value == 1
        ? {
            "payType": value,
          }
        : {
            "payType": value,
            "payMethodID": paymentId,
          };
    payRepository
        .pay(id: id, context: context, data: data, type: value)
        .whenComplete(() => payController.reset());
    emit(PostPayState());
  }

  // goToPay({
  //   int? id,
  //   required BuildContext context,
  //   required bool wallet,
  //   String? amount,
  // }) {
  //   payRepository
  //       .goToPay(id: id ?? 0, context: context, wallet: wallet, amount: amount)
  //       .whenComplete((value) {
  //     payController.reset();
  //     emit(PostPayState());
  //   });
  // }

  cancelCourse(int id) {
    payRepository.cancelCourse(id).then((value) {
      showToast(tr("cancel_sub_success"));
      Get.offAll(() => const MainScreen());
      emit(LessonCancelState());
    });
  }

  cancelLesson(int id) {
    payRepository.cancelLesson(id).then((value) {
      showToast(tr("cancel_sub_success"));
      Get.offAll(() => const MainScreen());
      emit(CourseCancelState());
    });
  }
}

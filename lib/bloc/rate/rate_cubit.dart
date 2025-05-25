import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_academy/repository/user/rates/rates_repository.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

part 'rate_state.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit() : super(RateInitial());
  static RateCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController rateController = TextEditingController();
  List<String?> validators = [
    null,
  ];
  List<TextEditingController> controllers = [];
  RoundedLoadingButtonController loadController =
      RoundedLoadingButtonController();
  double? rating;
  void validate(
    String val,
  ) {
    switch (val.isEmpty) {
      case true:
        validators[0] = tr("error_message");
        emit(ValidateEmptyState());
        break;
      case false:
        validators[0] = null;
        emit(ValidateNotEmptyState());
        break;
    }
    emit(ValidateState());
  }

  addRate({
    String? type,
    int? id,
  }) async {
    Map<String, dynamic> data = {
      "type": type,
      "id": id,
      "rate": rating ?? 0,
    };
    RateRepository().addRate(data).whenComplete(() {
      Get.back();
      loadController.reset();
    });
  }
}

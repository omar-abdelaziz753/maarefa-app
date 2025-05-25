import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import '../../model/common/cities/city_model.dart';
import '../../repository/provider/bank_account/bank_account_repository.dart';
part 'bank_account_state.dart';

class BankAccountCubit extends Cubit<BankAccountState> {
  BankAccountCubit(this.bankAccountRepository) : super(BankAccountInitial());
  static BankAccountCubit get(BuildContext context) => BlocProvider.of(context);
  BankAccountRepository bankAccountRepository;

  TextEditingController swiftCode = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController iban = TextEditingController();
  TextEditingController address = TextEditingController();
  RoundedLoadingButtonController addController =
      RoundedLoadingButtonController();
  List<TextEditingController> controllers = [];
  List<String?> validators = [null, null, null, null];

  CityModel? city;
  String? cityName;
  int? cityId;

  chooseCity(val) {
    switch (city == val) {
      case true:
        city = val;
        cityName = val.name;
        cityId = val.id;
        emit(SameCityState());
        break;
      case false:
        city = val;
        cityName = val.name;
        cityId = val.id;
        emit(ChangeCityState());
        break;
    }
    emit(ChooseCityState());
  }

  void validate(String val, int index) {
    val.isEmpty
        ? validators[index] = tr("error_message")
        : validators[index] = null;
    emit(ValidateState());
  }

  addBankAccount() {
    if (swiftCode.text.isEmpty ||
        bankName.text.isEmpty ||
        iban.text.isEmpty ||
        address.text.isEmpty) {
      controllers = [swiftCode, bankName, iban, address];
      for (int i = 0; i < controllers.length; i++) {
        controllers[i].text.isEmpty
            ? validators[i] = tr("error_message")
            : validators[i] = null;
      }
      addController.reset();
    } else {
      Map<String, dynamic> data = {
        "swift_code": swiftCode.text.trim(),
        "bank_name": bankName.text.trim(),
        "iban": iban.text.trim(),
        "city_id": cityId,
        "address": address.text.trim(),
      };
      bankAccountRepository
          .bankAccount(data)
          .whenComplete(() => addController.reset());
    }
    emit(AddAccountMessageState());
  }

  requestPay() {
      bankAccountRepository
          .requestPay()
          .whenComplete(() => addController.reset());
    emit(RequestPayState());
  }
}

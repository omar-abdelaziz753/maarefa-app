import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../repository/static_pages/contact_us/contact_us_repository.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.contactUsRepository) : super(ContactUsInitial());
  static ContactUsCubit get(BuildContext context) => BlocProvider.of(context);
  ContactUsRepository contactUsRepository;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  RoundedLoadingButtonController authController = RoundedLoadingButtonController();
  List<TextEditingController> controllers = [];
  List<String?> validators = [null, null, null, null];

  void validate(String val, int index) {
    val.isEmpty
        ? validators[index] = tr("error_message")
        : validators[index] = null;
    emit(ValidateState());
  }

  contactUs() {
    if (name.text.isEmpty ||
        phone.text.isEmpty ||
        email.text.isEmpty ||
        message.text.isEmpty) {
      controllers = [name, phone, email, message];
      for (int i = 0; i < controllers.length; i++) {
        controllers[i].text.isEmpty
            ? validators[i] = tr("error_message")
            : validators[i] = null;
      }
      authController.reset();
    } else {
      Map<String, dynamic> data = {
        "name": name.text.trim(),
        "phone": phone.text.trim(),
        "email": email.text.trim(),
        "message": message.text.trim()
      };
      contactUsRepository
          .contactUs(data)
          .whenComplete(() => authController.reset());
    }
    emit(ContactUsMessageState());
  }
}
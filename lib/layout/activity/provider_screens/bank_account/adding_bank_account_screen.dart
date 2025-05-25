import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../view/cities/cities_bank/cities_bank_view.dart';
import '../../../view/connectivity/connectivity_view.dart';

class AddingBankAccount extends StatelessWidget {
  const AddingBankAccount({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("add_bank")),
      body: const ConnectivityView(child: CitiesBankView()),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/layout/view/connectivity/connectivity_view.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';

import '../../../../view/payment_method/payment_method_view.dart';

class PayScreen extends StatelessWidget {
  final int id;
  final int? requestId;
  final String type;
  final bool isRequest;
  const PayScreen(
      {super.key,
      required this.id,
      required this.type,
      this.isRequest = false,
      this.requestId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("requset_summary")),
      body: ConnectivityView(
        child: PaymentMethodView(
          isWallet: false,
          isCourse: type == "course" ? true : false,
          id: id,
          // requestId: reuestId,
          isRequest: isRequest,
        ),
      ),
    );
  }
}

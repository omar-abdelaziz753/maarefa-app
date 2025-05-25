import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../res/value/color/color.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../view/connectivity/connectivity_view.dart';
import '../../../view/offers/offers_view.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: DefaultAppBar(title: tr("offers")),
      body: const ConnectivityView(child: OffersView()),
    );
  }
}

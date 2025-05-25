import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';

import '../../../view/certificate/certificate_view.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("certificate")),
      body: const CertificateView(),
    );
  }
}

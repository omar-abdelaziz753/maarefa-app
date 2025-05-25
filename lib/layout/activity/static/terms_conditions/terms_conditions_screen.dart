import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/res/drawable/image/images.dart';

import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../view/static/terms_view.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key, required this.isUser});
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset.topCenter,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            staticBackground,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: DefaultAppBar(title: tr("terms"), centerTitle: false),
            body: TermsView(isUser: isUser)),
      ],
    );
  }
}

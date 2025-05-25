import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';

import '../../../../res/drawable/image/images.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';
import '../../../view/payment_method/payment_method_view.dart';

class WalletCharging extends StatelessWidget {
  const WalletCharging({super.key, required bool isUser, this.walletCredit});
  final double? walletCredit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset.topCenter,
      children: [
        SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Image.asset(
            staticBackground,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: transparent,
          appBar: DefaultAppBar(title: tr("wallet"), centerTitle: false),
          body: SidePadding(
            sidePadding: 20,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child:
                      Image.asset(wallet, height: 300.h, fit: BoxFit.contain),
                ),
                Space(boxHeight: 100.h),
                Column(
                  children: [
                    Text(tr("amount_found"),
                        style: TextStyles.headerStyle.copyWith(
                          color: black,
                        )),
                    Text(walletCredit.toString(),
                        // tr("2.000"),
                        style: TextStyles.headerStyle.copyWith(
                          color: mainColor,
                        )),
                    Text(tr("sar"),
                        style: TextStyles.headerStyle.copyWith(
                          color: mainColor,
                          fontSize: 16,
                        )),
                  ],
                ),
                const Space(
                  boxHeight: 100,
                ),
                MasterButton(
                  // buttonStyle: TextStyles.appBarStyle
                  //     .copyWith(color: mainColor),
                  buttonText: tr("wallet_charging"),
                  onPressed: () {
                    _showDialog(context);
                  },
                ),
                const Space(
                  boxHeight: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

_showDialog(context) async {
  await showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: const PaymentMethodView(
            isWallet: true,
            isCourse: false,
          )));
}

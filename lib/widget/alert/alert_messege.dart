import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../layout/activity/user_screens/main/main_screen.dart';
import '../../res/drawable/icon/icons.dart';
import '../../res/value/color/color.dart';
import '../../res/value/style/textstyles.dart';
import '../buttons/master/master_button.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({super.key, required String message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Simple Alert Dialog'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SimpleAlert();
                });
          },
        ),
      ),
    );
  }
}

class SimpleAlert extends StatelessWidget {
  const SimpleAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: (() {
                    Get.back();
                  }),
                  child: Image.asset(circleXmark)),
            ],
          ),
          Center(child: Text(tr("request_gone"))),
        ],
      ),
      titleTextStyle: TextStyles.appBarStyle.copyWith(color: inProgressColor),
      content: (Text(
        tr("service_provider"),
        style: TextStyles.hintStyle.copyWith(color: blackColor),
      )),
      actions: [
        MasterButton(
            buttonText: tr("ok"),
            buttonRadius: 5,
            sidePadding: 75,
            buttonHeight: 50,
            onPressed: () => Get.offAll(() => const MainScreen()))
      ],
    );
  }
}

class ProviderSimpleAlert extends StatelessWidget {
  const ProviderSimpleAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: (() {
                    Get.back();
                  }),
                  child: Image.asset(circleXmark)),
            ],
          ),
          Center(child: Text(tr("request_gone"))),
        ],
      ),
      titleTextStyle: TextStyles.appBarStyle.copyWith(color: inProgressColor),
      content: (Text(
        tr("add_cource_alert"),
        style: TextStyles.hintStyle.copyWith(color: blackColor),
      )),
      actions: [
        MasterButton(
            buttonText: tr("ok"),
            buttonRadius: 5,
            sidePadding: 75,
            buttonHeight: 60,
            onPressed: () => Get.back())
      ],
    );
  }
}

class WalletSimpleAlert extends StatelessWidget {
  const WalletSimpleAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: TextStyles.appBarStyle.copyWith(color: inProgressColor),
      content: (Text(
        tr("success_pay"),
        style: TextStyles.appBarStyle.copyWith(color: inProgressColor),
      )),
      actions: [
        MasterButton(
            buttonText: tr("ok"),
            buttonRadius: 5,
            sidePadding: 75,
            buttonHeight: 70,
            onPressed: () => Get.offAll(() => const MainScreen()))
      ],
    );
  }
}

class RequestAddAlert extends StatelessWidget {
  const RequestAddAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: TextStyles.appBarStyle.copyWith(color: inProgressColor),
      content: Text(
        tr("request_gone_ads"),
        textAlign: TextAlign.center,
        style: TextStyles.appBarStyle.copyWith(color: inProgressColor),
      ),
      actions: [
        MasterButton(
          buttonText: tr("ok"),
          buttonRadius: 5,
          sidePadding: 75,
          buttonHeight: 70,
          onPressed: () {
            Get.back();
            Get.back();
          },
        )
      ],
    );
  }
}

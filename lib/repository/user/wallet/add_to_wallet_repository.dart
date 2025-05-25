import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_academy/service/local/share_prefs_service.dart';
import 'package:my_academy/service/network/dio/dio_service.dart';
import 'package:my_academy/widget/toast/toast.dart';

import '../../../layout/activity/user_screens/payment/payment_screen.dart';

class WalletRepository {
  SharedPrefService prefService = SharedPrefService();

  addToWallet({
    required int id,
    String? amount,
  }) async {
    try {
      return await DioService().post('/client/auth/addToWallet',
          body: {"amount": amount, "payMethodID": id}).then((value) {
        return value.fold((l) => showToast("$l"), (r) {
          // if(r["status"]==400){
          //
          // }else{
          // prefService.setValue('profile', json.encode(r["data"])).then((value) =>Get.back());
          // Get.offAll(()=>
          // const MainScreen());
          Get.to(() => PaymentScreen(
                paymentUrl: r["data"],
                payMethodID: id,
              ));

          //     WalletCharging(
          //   isUser: true,
          //   walletCredit: r["data"]["wallet"],
          // )
          return;
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

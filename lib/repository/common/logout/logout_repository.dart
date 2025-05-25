import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/splash/splash_screen.dart';

import '../../../failure.dart';
import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/alert/alert_messege.dart';
import '../../../widget/toast/toast.dart';

class Logout {
  SharedPrefService prefService = SharedPrefService();

  logoutProvider(String phone) async {
    try {
      return DioService().post('/provider/auth/signout', body: {
        "phone": phone,
      }).then((value) => value.fold((l) => AlertMessage(message: '$l'), (r) {
            showToast(r['message']);

            prefService.setBool("seen", false);
            Get.to(() => const SplashScreen());
          }));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  logoutClient(String phone) async {
    try {
      return DioService().post('/client/auth/signout', body: {
        "phone": phone,
      }).then((value) => value.fold((l) => AlertMessage(message: '$l'), (r) {
            showToast(r['message']);
            Get.to(() => const SplashScreen());
          }));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

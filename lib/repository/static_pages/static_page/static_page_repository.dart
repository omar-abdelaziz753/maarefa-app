import 'package:flutter/cupertino.dart';

import '../../../model/static_pages/static_page/static_screens_db_response.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class StaticScreensRepository {
  about() async {
    try {
      return await DioService()
          .get('/static_pages/about')
          .then((value) => value.fold((l) => showToast(l), (r) {
                StaticScreensDbResponse about =
                    StaticScreensDbResponse.fromJson(r);
                return about;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  terms({required bool isUser}) async {
    try {
      return await DioService()
          .get('/static_pages/terms')
          .then((value) => value.fold((l) => showToast(l), (r) {
                StaticScreensDbResponse terms =
                    StaticScreensDbResponse.fromJson(r);
                return terms;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  privacy() async {
    try {
      return await DioService()
          .get('/static_pages/privacy')
          .then((value) => value.fold((l) => showToast(l), (r) {
                StaticScreensDbResponse privacy =
                    StaticScreensDbResponse.fromJson(r);
                return privacy;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // contactUs(Map<String, dynamic> data) async {
  //   try {
  //     return DioService()
  //     .post('/contact_us', body: data)
  //         .then((value) => value.fold((l) => showToast("$l"), (r) {
  //       showToast(r['message']);
  //       // Get.to(() => const CodeScreen(
  //       //   // phone: phone
  //       // ));
  //     }));
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';
import '../../layout/activity/provider_screens/main/main_screen.dart';
import '../../model/subscribers/subscribers_response.dart';

class SubscribersRepository {
  getSubscribers(int id) async {
    try {
      return await DioService()
          .get('/providers/courses/$id/subscribers')
          .then((value) => value.fold((l) => showToast(l), (r) {
                SubscribersDbResponse subscribersModel =
                    SubscribersDbResponse.fromJson(r);
                return subscribersModel;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future sendCertificate(int id, int request, int client) async {
    try {
      return await DioService().post("/providers/courses/$id/singCertificate",
          body: {
            "request_id": request,
            "client_id": client
          }).then((value) => value.fold((l) => showToast(l), (r) {
            showToast(r["messages"]);
            Get.offAll(() => const ProviderMainScreen());
            SubscribersDbResponse subscribersModel =
                SubscribersDbResponse.fromJson(r);
            return subscribersModel;
          }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  sendPDFCertificate(int id, int request, int client, File cerFile) async {
    try {
      return await DioService()
          .requestWithFile(
              cerFile,
              {"request_id": request, "client_id": client},
              "/providers/courses/$id/singCertificate",
              "file")
          .then((value) => value.fold((l) => showToast(l), (r) {
                showToast(r["messages"]);
                Get.offAll(() => const ProviderMainScreen());
                SubscribersDbResponse subscribersModel =
                    SubscribersDbResponse.fromJson(r);
                return subscribersModel;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

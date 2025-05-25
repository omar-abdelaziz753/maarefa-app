import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/provider/requests/items_has_request/items_has_request_db_response.dart';
import '../../../model/provider/requests/show_item_requests/show_item_requests_db_response.dart';
import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../layout/activity/provider_screens/main/main_screen.dart';
import '../../../widget/toast/toast.dart';

class RequestsProvider {
  SharedPrefService prefService = SharedPrefService();

  changeRequestStatus(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      return await DioService()
          .post('/provider/requests/$id/changeStatus', body: data)
          .then((value) => value.fold((l) => showToast(l), (r) {
                showToast(r["messages"]);
                Get.offAll(() => const ProviderMainScreen());
                // ChangeRequestStatusDbResponse changeRequestStatus =
                //     ChangeRequestStatusDbResponse.fromJson(r);
                // return changeRequestStatus;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getItemsHasRequest(String type, int page) async {
    try {
      return await DioService()
          .get('/provider/requests?type=$type&page=$page')
          .then((value) => value.fold((l) => showToast(l), (r) {
                Object item;
                type == "course"
                    ? item = ItemsHasRequestDbResponse.fromJson(r)
                    : item = LessonsHasRequestDbResponse.fromJson(r);
                type == "course"
                    ? prefService.setValue("requests_course", json.encode(r))
                    : prefService.setValue("requests_lesson", json.encode(r));
                return item;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getItemsHasRequestCache(String type) async {
    final prefs = await SharedPreferences.getInstance();
    if (type == "course") {
      if (prefs.containsKey('requests_course')) {
        var response = prefs.getString('requests_course');
        ItemsHasRequestDbResponse courseResponse =
            ItemsHasRequestDbResponse.fromJson(json.decode(response!));
        return courseResponse;
      }
    } else {
      if (prefs.containsKey('requests_lesson')) {
        var response = prefs.getString('requests_lesson');
        LessonsHasRequestDbResponse lessonResponse =
            LessonsHasRequestDbResponse.fromJson(json.decode(response!));
        return lessonResponse;
      }
    }
  }

  getItemsRequestDetails(String type, int id, int page) async {
    try {
      return await DioService()
          .get('/provider/requests/showRequests?type=$type&id=$id&page=$page')
          .then((value) => value.fold((l) => showToast(l), (r) {
                ShowItemRequestDbResponse itemsDetails =
                    ShowItemRequestDbResponse.fromJson(r);
                return itemsDetails;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

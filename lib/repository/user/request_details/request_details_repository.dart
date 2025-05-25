import 'package:flutter/cupertino.dart';
import 'package:my_academy/model/user/request_details/request_details_db_response.dart';

import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class RequestDetailsRepository {
  requestDetails(int id) async {
    try {
      return await DioService()
          .get('/clients/requests/$id/show')
          .then((value) => value.fold((l) => showToast(l), (r) {
        RequestDetailsDbResponse requestDetails =
        RequestDetailsDbResponse.fromJson(r);
        return requestDetails;
      }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

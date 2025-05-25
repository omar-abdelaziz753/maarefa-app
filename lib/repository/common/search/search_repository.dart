import 'package:flutter/cupertino.dart';

import '../../../model/common/search/search_db_response.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class SearchRepository {
  getSearchedItems(String name) async {
    try {
      return await DioService()
          .get('/client/search?name=$name')
          .then((value) => value.fold((l) => showToast(l), (r) {
                SearchDbResponse searchDbResponse =
                    SearchDbResponse.fromJson(r);
                return searchDbResponse;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

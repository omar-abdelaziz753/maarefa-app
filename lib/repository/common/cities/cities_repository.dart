import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/common/cities/cities_db_response.dart';
import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class CitiesRepository {
  SharedPrefService prefService = SharedPrefService();

  getCitiesInSplash() async {
    try {
      return await DioService()
          .get('/cities')
          .then((value) => value.fold((l) => showToast(l), (r) {
                prefService.setValue('cities', json.encode(r));
                CitiesDBResponse cityModel = CitiesDBResponse.fromJson(r);
                return cityModel;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCities() async {
    final prefs = await SharedPreferences.getInstance();
    String? response = prefs.getString("cities");

    try {
      // var response = value;
      if (response != null) {
        CitiesDBResponse citiesModel =
            CitiesDBResponse.fromJson(json.decode(response));
        return citiesModel;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

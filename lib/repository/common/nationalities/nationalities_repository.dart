import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_academy/model/common/nationalities/nationalities_db_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class NationalitiesRepository {
  SharedPrefService prefService = SharedPrefService();

  getNationsInSplash() async {
    try {
      return await DioService()
          .get('/nationalities')
          .then((value) => value.fold((l) => showToast(l), (r) {
                prefService.setValue('nations', json.encode(r));
                NationalityDbResponse nationalityModel =
                    NationalityDbResponse.fromJson(r);
                return nationalityModel;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getNations() async {
    final prefs = await SharedPreferences.getInstance();
    String? response = prefs.getString("nations");

    try {
      // var response = value;
      NationalityDbResponse nationsModel =
          NationalityDbResponse.fromJson(json.decode(response!));
      return nationsModel;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

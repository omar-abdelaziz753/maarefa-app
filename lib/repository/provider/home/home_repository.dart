import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/provider/home/home_db_response.dart';
import '../../../model/slider/slider_response.dart';
import '../../../model/slider/offers_response.dart';
import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';

class HomeRepository {
  SharedPrefService prefService = SharedPrefService();

  Future<HomeDbResponse> getProviderHome() async {
    try {
      HomeDbResponse? home;
      final res = await DioService().get('/provider/home');
      res.fold((l) => debugPrint(l.toString()), (r) {
        home = HomeDbResponse.fromJson(r);
        prefService.setValue("home", json.encode(r));
      });
      return home!;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

  Future<HomeDbResponse> getClientHome() async {
    try {
      HomeDbResponse? home;
      final res = await await DioService().get('/client/home');
      res.fold((l) => debugPrint(l.toString()), (r) {
        home = HomeDbResponse.fromJson(r);
        prefService.setValue("home", json.encode(r));
      });
      return home!;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

  getCacheHome() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('home')) {
      var response = prefs.getString('home');
      HomeDbResponse homeResponse =
          HomeDbResponse.fromJson(json.decode(response!));
      return homeResponse;
    }
  }

  getSlider() async {
    try {
      return await DioService()
          .get('/offers/slider')
          .then((value) => value.fold((l) => debugPrint(l.toString()), (r) {
                SliderDbResponse slider = SliderDbResponse.fromJson(r);
                prefService.setValue("slider", json.encode(r));
                return slider;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCacheSlider() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('slider')) {
      var response = prefs.getString('slider');
      SliderDbResponse sliderResponse =
          SliderDbResponse.fromJson(json.decode(response!));
      return sliderResponse;
    }
  }

  getOffers() async {
    try {
      return await DioService()
          .get('/offers')
          .then((value) => value.fold((l) => debugPrint(l.toString()), (r) {
                OffersDbResponse slider = OffersDbResponse.fromJson(r);
                prefService.setValue("offers", json.encode(r));
                return slider;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCacheOffers() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('offers')) {
      var response = prefs.getString('offers');
      SliderDbResponse sliderResponse =
          SliderDbResponse.fromJson(json.decode(response!));
      return sliderResponse;
    }
  }
}

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../model/location_model/predictions_model.dart';
import '../../widget/toast/toast.dart';
import '../network/api/api.dart';
import '../network/dio/dio_service.dart';

class LocationService {
  PredictionsModel? predictions;
  final searchController = TextEditingController();
  final StreamController<PredictionsModel> _searchController =
      StreamController();
  Stream<PredictionsModel> get searchStream => _searchController.stream;

  /// Stream Method
  PredictionsModel? searchPlace(String input) {
    if (input.isNotEmpty) {
      autoComplete(input).then((result) {
        _searchController.sink.add(result!);
      }).catchError((error) {
        if (kDebugMode) {
          print(error);
        }
      });
    } else {
      _searchController.add(predictions!);
    }
    return predictions;
  }

  /// Auto Complete
  autoComplete(String input) async {
    // print("map");
    String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$key&language=${Get.locale!.languageCode}";

    await DioService()
        .get(url)
        .then((value) => value.fold((l) => showToast("$l"), (r) {
              PredictionsModel predicyionResponse =
                  PredictionsModel.fromJson(r);

              return predicyionResponse;
            }));
  }

  /// Get Placed ID
  Future<String> getPlaceId(String input) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key";

    var response = await Dio().get(url);
    var placeId = response.data['candidates'][0]['place_id'].toString();

    return placeId;
  }

  /// Get Place
  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);

    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await DioService().get(url);
    var results = response.data['result'] as Map<String, dynamic>;

    return results;
  }
}

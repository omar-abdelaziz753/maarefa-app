

import 'place_model.dart';

class PredictionsModel {

  List<PlaceModel>? predictions;

  PredictionsModel.fromJson(Map<String,dynamic> json)
  {
    if (json['predictions'] != null) {
      final placeList = json['predictions'];
      final placeData = <PlaceModel>[];
      placeList.forEach((v) {
        placeData.add(PlaceModel.fromJson(v));
      });
      predictions = placeData;
    }
  }
}
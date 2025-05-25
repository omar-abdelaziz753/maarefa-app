import 'dart:convert';

import 'package:my_academy/model/common/cities/city_model.dart';


CitiesDBResponse citiesModelFromJson(String str) => CitiesDBResponse.fromJson(json.decode(str));

class CitiesDBResponse {

  CitiesDBResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  dynamic messages;
  List<CityModel>? data;

  factory CitiesDBResponse.fromJson(Map<String, dynamic> json) => CitiesDBResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: List<CityModel>.from(json["data"].map((x) => CityModel.fromJson(x))),
  );
}
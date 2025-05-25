import 'dart:convert';

import 'package:my_academy/model/user/rates/rates_model.dart';

RatesDbResponse ratesDbResponseFromJson(String str) => RatesDbResponse.fromJson(json.decode(str));

class RatesDbResponse {
  RatesDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  String? messages;
  RateModel? data;

  factory RatesDbResponse.fromJson(Map<String, dynamic> json) => RatesDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: RateModel.fromJson(json["data"]),
  );
}


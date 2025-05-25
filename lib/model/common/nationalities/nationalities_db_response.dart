import 'dart:convert';

import 'nationality_model.dart';

NationalityDbResponse nationalityDbResponseFromJson(String str) => NationalityDbResponse.fromJson(json.decode(str));

class NationalityDbResponse {

  NationalityDbResponse({
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
  List<NationalityModel>? data;

  factory NationalityDbResponse.fromJson(Map<String, dynamic> json) => NationalityDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: List<NationalityModel>.from(json["data"].map((x) => NationalityModel.fromJson(x))),
  );
}

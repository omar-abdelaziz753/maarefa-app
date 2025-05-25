import 'dart:convert';

import 'package:my_academy/model/static_pages/static_page/static_screens_model.dart';

StaticScreensDbResponse staticScreensDbResponseFromJson(String str) => StaticScreensDbResponse.fromJson(json.decode(str));

class StaticScreensDbResponse {
  StaticScreensDbResponse({
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
  StaticScreensModel? data;

  factory StaticScreensDbResponse.fromJson(Map<String, dynamic> json) => StaticScreensDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: StaticScreensModel.fromJson(json["data"]),
  );
}

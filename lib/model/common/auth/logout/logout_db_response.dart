import 'dart:convert';

import 'logout_model.dart';

LogOutDbResponse logOutDbResponseFromJson(String str) => LogOutDbResponse.fromJson(json.decode(str));

class LogOutDbResponse {
  LogOutDbResponse({
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
  LogOutModel? data;

  factory LogOutDbResponse.fromJson(Map<String, dynamic> json) => LogOutDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: LogOutModel.fromJson(json["data"]),
  );
}
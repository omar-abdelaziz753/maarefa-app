import 'dart:convert';

import 'package:my_academy/model/user/request_details/request_details_model.dart';

RequestDetailsDbResponse showRequestDbResponseFromJson(String str) => RequestDetailsDbResponse.fromJson(json.decode(str));

class RequestDetailsDbResponse {
  RequestDetailsDbResponse({
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
  RequestDetailsModel? data;

  factory RequestDetailsDbResponse.fromJson(Map<String, dynamic> json) => RequestDetailsDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: RequestDetailsModel.fromJson(json["data"]),
  );
}
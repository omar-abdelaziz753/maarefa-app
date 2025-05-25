import 'dart:convert';

import 'change_request_status_model.dart';

ChangeRequestStatusDbResponse changeRequestStatusDbResponseFromJson(String str) => ChangeRequestStatusDbResponse.fromJson(json.decode(str));


class ChangeRequestStatusDbResponse {
  ChangeRequestStatusDbResponse({
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
  ChangeRequestStatus? data;

  factory ChangeRequestStatusDbResponse.fromJson(Map<String, dynamic> json) => ChangeRequestStatusDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: ChangeRequestStatus.fromJson(json["data"]),
  );

}
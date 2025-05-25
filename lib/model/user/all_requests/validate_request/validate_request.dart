// To parse this JSON data, do
//
//     final validateRequestModel = validateRequestModelFromJson(jsonString);

import 'dart:convert';

ValidateRequestModel validateRequestModelFromJson(String str) => ValidateRequestModel.fromJson(json.decode(str));

String validateRequestModelToJson(ValidateRequestModel data) => json.encode(data.toJson());

class ValidateRequestModel {
  ValidateRequestModel({
    this.success,
    this.errorCode,
    this.status,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? status;
  int? notificationsCount;
  dynamic messages;
  RequestMsg? data;

  factory ValidateRequestModel.fromJson(Map<String, dynamic> json) => ValidateRequestModel(
    success: json["success"],
    errorCode: json["errorCode"],
    status: json["status"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: RequestMsg.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "errorCode": errorCode,
    "status": status,
    "notificationsCount": notificationsCount,
    "messages": messages,
    "data": data!.toJson(),
  };
}

class RequestMsg {
  RequestMsg({
    this.message,
  });

  String? message;

  factory RequestMsg.fromJson(Map<String, dynamic> json) => RequestMsg(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}

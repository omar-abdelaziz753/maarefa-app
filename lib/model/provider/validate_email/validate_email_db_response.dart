import 'dart:convert';

import 'package:my_academy/model/provider/validate_email/validate_email_model.dart';

ValidateEmailDbResponse validateEmailDbResponseFromJson(String str) => ValidateEmailDbResponse.fromJson(json.decode(str));

class ValidateEmailDbResponse {
  ValidateEmailDbResponse({
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
  ValidateEmailModel? data;

  factory ValidateEmailDbResponse.fromJson(Map<String, dynamic> json) => ValidateEmailDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: ValidateEmailModel.fromJson(json["data"]),
  );
}

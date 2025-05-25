import 'dart:convert';

import 'package:my_academy/model/common/auth/validate/validate_model.dart';

ValidateDbResponse validateDbResponseFromJson(String str) => ValidateDbResponse.fromJson(json.decode(str));

class ValidateDbResponse {
  ValidateDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.registerValidate,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  dynamic messages;
  ValidateModel? registerValidate;

  factory ValidateDbResponse.fromJson(Map<String, dynamic> json) => ValidateDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    registerValidate: ValidateModel.fromJson(json["data"]),
  );
}
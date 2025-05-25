import 'dart:convert';

import 'auth_model.dart';

RegisterDbResponse registerDbResponseFromJson(String str) => RegisterDbResponse.fromJson(json.decode(str));

class RegisterDbResponse {
  RegisterDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.auth,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  dynamic messages;
  AuthModel? auth;

  factory RegisterDbResponse.fromJson(Map<String, dynamic> json) => RegisterDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    auth: AuthModel.fromJson(json["data"]),
  );
}
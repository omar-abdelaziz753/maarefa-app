import 'dart:convert';

import 'package:my_academy/model/user/show_providers/show_providers_model.dart';

ShowProvidersDbResponse showProvidersDbResponseFromJson(String str) =>
    ShowProvidersDbResponse.fromJson(json.decode(str));

class ShowProvidersDbResponse {
  ShowProvidersDbResponse({
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
  ShowProvidersModel? data;

  factory ShowProvidersDbResponse.fromJson(Map<String, dynamic> json) =>
      ShowProvidersDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: ShowProvidersModel.fromJson(json["data"]),
      );
}

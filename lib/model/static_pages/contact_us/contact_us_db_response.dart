import 'dart:convert';

import 'contact_us_model.dart';

ContactUsDbResponse contactUsDbResponseFromJson(String str) => ContactUsDbResponse.fromJson(json.decode(str));

class ContactUsDbResponse {
  ContactUsDbResponse({
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
  ContactUsModel? data;

  factory ContactUsDbResponse.fromJson(Map<String, dynamic> json) => ContactUsDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: ContactUsModel.fromJson(json["data"]),
  );
}
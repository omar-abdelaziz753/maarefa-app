import 'dart:convert';

PayDbResponse payDbResponseFromJson(String str) => PayDbResponse.fromJson(json.decode(str));

class PayDbResponse {
  PayDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  String? messages;
  dynamic data;

  factory PayDbResponse.fromJson(Map<String, dynamic> json) => PayDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: json["data"],
  );
}

import 'dart:convert';

SignCertificateDbResponse signCertificateDbResponseFromJson(String str) => SignCertificateDbResponse.fromJson(json.decode(str));

class SignCertificateDbResponse {
  SignCertificateDbResponse({
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

  factory SignCertificateDbResponse.fromJson(Map<String, dynamic> json) => SignCertificateDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: json["data"],
  );
}
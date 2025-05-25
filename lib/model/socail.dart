// To parse this JSON data, do
//
//     final SocialResponse = SocialResponseFromJson(jsonString);

import 'dart:convert';

SocialResponse socialResponseFromJson(String str) =>
    SocialResponse.fromJson(json.decode(str));

String socialResponseToJson(SocialResponse data) => json.encode(data.toJson());

class SocialResponse {
  SocialResponse({
    required this.success,
    required this.errorCode,
    required this.status,
    required this.notificationsCount,
    required this.messages,
    required this.data,
  });

  bool success;
  int errorCode;
  int status;
  int notificationsCount;
  String messages;
  List<Social> data;

  factory SocialResponse.fromJson(Map<String, dynamic> json) => SocialResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: List<Social>.from(json["data"].map((x) => Social.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errorCode": errorCode,
        "status": status,
        "notificationsCount": notificationsCount,
        "messages": messages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Social {
  Social({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        key: json["key"],
        value: json["value"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

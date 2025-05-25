import 'dart:convert';
import 'items_has_request_model.dart';

ItemsHasRequestDbResponse itemsHasRequestDbResponseFromJson(String str) => ItemsHasRequestDbResponse.fromJson(json.decode(str));
LessonsHasRequestDbResponse lessonsHasRequestDbResponseFromJson(String str) => LessonsHasRequestDbResponse.fromJson(json.decode(str));

class ItemsHasRequestDbResponse {
  ItemsHasRequestDbResponse({
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
  ItemsHasRequestModel? data;

  factory ItemsHasRequestDbResponse.fromJson(Map<String, dynamic> json) => ItemsHasRequestDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: ItemsHasRequestModel.fromJson(json["data"]),
  );
}

class LessonsHasRequestDbResponse {
  LessonsHasRequestDbResponse({
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
  LessonsHasRequestModel? data;

  factory LessonsHasRequestDbResponse.fromJson(Map<String, dynamic> json) => LessonsHasRequestDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: LessonsHasRequestModel.fromJson(json["data"]),
  );
}
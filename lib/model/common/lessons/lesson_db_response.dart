import 'dart:convert';

import 'lesson_model.dart';

LessonDetailsDbResponse lessonsDbResponseFromJson(String str) =>
    LessonDetailsDbResponse.fromJson(json.decode(str));

class LessonDetailsDbResponse {
  LessonDetailsDbResponse({
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
  LessonDetails? data;

  factory LessonDetailsDbResponse.fromJson(Map<String, dynamic> json) =>
      LessonDetailsDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: LessonDetails.fromJson(json["data"]),
      );
}

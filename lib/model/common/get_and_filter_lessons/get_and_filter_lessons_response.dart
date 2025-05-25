import 'dart:convert';

import 'package:my_academy/model/common/get_and_filter_lessons/get_and_filter_lessons_model.dart';

AllLessonsDbResponse lessonsDbResponseFromJson(String str) =>
    AllLessonsDbResponse.fromJson(json.decode(str));

class AllLessonsDbResponse {
  AllLessonsDbResponse({
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
  dynamic messages;
  GetAndFilterLessonsModel data;

  factory AllLessonsDbResponse.fromJson(Map<String, dynamic> json) =>
      AllLessonsDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: GetAndFilterLessonsModel.fromJson(json["data"]),
      );
}

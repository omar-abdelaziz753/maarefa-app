import 'dart:convert';

import '../../../common/lessons/lesson_model.dart';

AddBookmarkLessonDbResponse addBookMarkCourseModelFromJson(String str) =>
    AddBookmarkLessonDbResponse.fromJson(json.decode(str));

class AddBookmarkLessonDbResponse {
  AddBookmarkLessonDbResponse({
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
  List<LessonDetails>? data;

  factory AddBookmarkLessonDbResponse.fromJson(Map<String, dynamic> json) =>
      AddBookmarkLessonDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: List<LessonDetails>.from(
            json["data"].map((x) => LessonDetails.fromJson(x))),
      );
}

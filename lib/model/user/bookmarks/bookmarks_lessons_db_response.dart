
import '../../common/lessons/lesson_model.dart';

class BookmarksLessonsResponse {
  BookmarksLessonsResponse({
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

  factory BookmarksLessonsResponse.fromJson(Map<String, dynamic> json) => BookmarksLessonsResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    status: json["status"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: List<LessonDetails>.from(json["data"].map((x) => LessonDetails.fromJson(x))),
  );
}
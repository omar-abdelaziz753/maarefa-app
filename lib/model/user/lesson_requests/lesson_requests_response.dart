import 'lesson_requests_model.dart';

class LessonRequestsResponse {
  LessonRequestsResponse({
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
  LessonRequestsModel? data;

  factory LessonRequestsResponse.fromJson(Map<String, dynamic> json) => LessonRequestsResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    status: json["status"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: LessonRequestsModel.fromJson(json["data"]),
  );}
import 'add_request_lesson_model.dart';

class AddRequestLessonDbResponse {
  AddRequestLessonDbResponse({
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
  AddRequestLessonModel? data;

  factory AddRequestLessonDbResponse.fromJson(Map<String, dynamic> json) =>
      AddRequestLessonDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: AddRequestLessonModel.fromJson(json["data"]),
      );
}

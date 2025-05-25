import 'dart:convert';
import 'package:my_academy/model/user/subscriptions/subscribe_subject/subscribe_subject_model.dart';


SubscribeLessonResponse subscribeLessonResponseFromJson(String str) => SubscribeLessonResponse.fromJson(json.decode(str));


class SubscribeLessonResponse {
  SubscribeLessonResponse({
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
  SubscribeSubjectModel? data;

  factory SubscribeLessonResponse.fromJson(Map<String, dynamic> json) => SubscribeLessonResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    status: json["status"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: SubscribeSubjectModel.fromJson(json["data"]),
  );
}
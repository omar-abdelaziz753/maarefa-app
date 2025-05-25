import 'dart:convert';
import 'package:my_academy/model/user/subscriptions/subscribe_course/subscribe_course_model.dart';

SubscribeCourseResponse subscribeCourseResponseFromJson(String str) => SubscribeCourseResponse.fromJson(json.decode(str));

class SubscribeCourseResponse {
  SubscribeCourseResponse({
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
  SubscribeCourseModel? data;

  factory SubscribeCourseResponse.fromJson(Map<String, dynamic> json) => SubscribeCourseResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: SubscribeCourseModel.fromJson(json["data"]),
  );
}
import 'dart:convert';

import 'course_subscribers_model.dart';

CourseSubscribersResponse courseSubscribersResponseFromJson(String str) => CourseSubscribersResponse.fromJson(json.decode(str));


class CourseSubscribersResponse {
  CourseSubscribersResponse({
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
  List<CourseSubscriberModel>? data;

  factory CourseSubscribersResponse.fromJson(Map<String, dynamic> json) => CourseSubscribersResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: List<CourseSubscriberModel>.from(json["data"].map((x) => CourseSubscriberModel.fromJson(x))),
  );
}
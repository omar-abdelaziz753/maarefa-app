import 'dart:convert';

import 'course_requests_model.dart';

CoursesRequestsDbResponse allRequestsFromJson(String str) =>
    CoursesRequestsDbResponse.fromJson(json.decode(str));

class CoursesRequestsDbResponse {
  CoursesRequestsDbResponse({
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
  CoursesRequestsModel? data;

  factory CoursesRequestsDbResponse.fromJson(Map<String, dynamic> json) =>
      CoursesRequestsDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: json["data"] == null
            ? json["data"]
            : CoursesRequestsModel.fromJson(json["data"]),
      );
}

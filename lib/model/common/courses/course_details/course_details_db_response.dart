// To parse this JSON data, do
//
//     final courseDetailsDbResponse = courseDetailsDbResponseFromJson(jsonString);

import 'dart:convert';

import 'course_details_model.dart';

CourseDetailsDbResponse courseDetailsDbResponseFromJson(String str) =>
    CourseDetailsDbResponse.fromJson(json.decode(str));

String courseDetailsDbResponseToJson(CourseDetailsDbResponse data) =>
    json.encode(data.toJson());

class CourseDetailsDbResponse {
  CourseDetailsDbResponse({
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
  CourseDetailsModel? data;

  factory CourseDetailsDbResponse.fromJson(Map<String, dynamic> json) =>
      CourseDetailsDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: CourseDetailsModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errorCode": errorCode,
        "status": status,
        "notificationsCount": notificationsCount,
        "messages": messages,
        "data": data!.toJson(),
      };
}

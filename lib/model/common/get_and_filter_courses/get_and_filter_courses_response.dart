import 'dart:convert';

import 'get_and_filter_courses_model.dart';

GetAndFilterCoursesDbResponse getAndFilterCoursesDbResponseFromJson(String str) => GetAndFilterCoursesDbResponse.fromJson(json.decode(str));

class GetAndFilterCoursesDbResponse {
  GetAndFilterCoursesDbResponse({
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
  GetAndFilterCoursesModel? data;

  factory GetAndFilterCoursesDbResponse.fromJson(Map<String, dynamic> json) => GetAndFilterCoursesDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: GetAndFilterCoursesModel.fromJson(json["data"]),
  );
}
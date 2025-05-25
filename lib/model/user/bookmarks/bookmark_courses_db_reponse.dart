// To parse this JSON data, do
//
//     final bookMarkCoursesModel = bookMarkCoursesModelFromJson(jsonString);

import 'dart:convert';

import 'bookmark_course_db_model.dart';

BookmarkCoursesResponse bookMarkCoursesModelFromJson(String str) =>
    BookmarkCoursesResponse.fromJson(json.decode(str));

String bookMarkCoursesModelToJson(BookmarkCoursesResponse data) =>
    json.encode(data.toJson());

class BookmarkCoursesResponse {
  BookmarkCoursesResponse({
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
  List<BookmarkCoursesModel>? data;

  factory BookmarkCoursesResponse.fromJson(Map<String, dynamic> json) =>
      BookmarkCoursesResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: List<BookmarkCoursesModel>.from(
            json["data"].map((x) => BookmarkCoursesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errorCode": errorCode,
        "status": status,
        "notificationsCount": notificationsCount,
        "messages": messages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

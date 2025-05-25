import 'dart:convert';

import '../bookmark_course_db_model.dart';

AddBookmarkCourseDbResponse addBookMarkCourseModelFromJson(String str) =>
    AddBookmarkCourseDbResponse.fromJson(json.decode(str));

class AddBookmarkCourseDbResponse {
  AddBookmarkCourseDbResponse({
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

  factory AddBookmarkCourseDbResponse.fromJson(Map<String, dynamic> json) =>
      AddBookmarkCourseDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: List<BookmarkCoursesModel>.from(
            json["data"].map((x) => BookmarkCoursesModel.fromJson(x))),
      );
}

class Specialization {
  Specialization({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

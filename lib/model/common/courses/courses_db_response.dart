import 'package:my_academy/model/common/courses/course_details/course_details_model.dart';
import 'package:my_academy/model/common/pagination/pagination_model.dart';

class CoursesDetailsDbResponse {
  CoursesDetailsDbResponse({
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
  CoursesDetailsModel? data;

  factory CoursesDetailsDbResponse.fromJson(Map<String, dynamic> json) =>
      CoursesDetailsDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: CoursesDetailsModel.fromJson(json["data"]),
      );
}

class CoursesDetailsModel {
  CoursesDetailsModel({
    this.courses,
    this.pagination,
  });

  List<CourseDetailsModel>? courses;
  PaginationModel? pagination;

  factory CoursesDetailsModel.fromJson(Map<String, dynamic> json) =>
      CoursesDetailsModel(
        courses: List<CourseDetailsModel>.from(
            json["courses"].map((x) => CourseDetailsModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : PaginationModel.fromJson(json["pagination"]),
      );
}

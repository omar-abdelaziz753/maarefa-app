import '../pagination/pagination_model.dart';
import 'course_model.dart';

class CoursesDbResponse {
  CoursesDbResponse({
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
  CoursesModel? data;

  factory CoursesDbResponse.fromJson(Map<String, dynamic> json) =>
      CoursesDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: CoursesModel.fromJson(json["data"]),
      );
}

class CoursesModel {
  CoursesModel({
    this.courses,
    this.pagination,
  });

  List<CourseModel>? courses;
  PaginationModel? pagination;

  factory CoursesModel.fromJson(Map<String, dynamic> json) => CoursesModel(
        courses: List<CourseModel>.from(
            json["courses"].map((x) => CourseModel.fromJson(x))),
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}

import '../courses/course_model.dart';
import '../pagination/pagination_model.dart';

class GetAndFilterCoursesModel {
  GetAndFilterCoursesModel({
    this.courses,
    this.pagination,
  });

  List<CourseModel>? courses;
  PaginationModel? pagination;

  factory GetAndFilterCoursesModel.fromJson(Map<String, dynamic> json) =>
      GetAndFilterCoursesModel(
        courses: List<CourseModel>.from(
            json["courses"].map((x) => CourseModel.fromJson(x))),
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}

import 'package:my_academy/model/common/courses/course_model.dart';
import '../../../common/lessons/lesson_model.dart';
import '../../../common/pagination/pagination_model.dart';

class ItemsHasRequestModel {
  ItemsHasRequestModel({
    required this.items,
    this.pagination,
    // required this.lessons
  });

   // List<LessonDetails> lessons;
  List<CourseModel> items;
  PaginationModel? pagination;

  factory ItemsHasRequestModel.fromJson(Map<String, dynamic> json) =>
      ItemsHasRequestModel(
        items:List<CourseModel>.from(json["items"].map((x) =>CourseModel.fromJson(x))),
        // lessons: List<LessonDetails>.from(json["lessons"].map((x) =>LessonDetails.fromJson(x)))??[],
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}

class LessonsHasRequestModel {
  LessonsHasRequestModel({
    this.pagination,
    required this.items
  });

  List<LessonDetails> items;
  PaginationModel? pagination;

  factory LessonsHasRequestModel.fromJson(Map<String, dynamic> json) =>
      LessonsHasRequestModel(
        items: List<LessonDetails>.from(json["items"].map((x) =>LessonDetails.fromJson(x))),
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}


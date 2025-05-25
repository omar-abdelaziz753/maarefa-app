import 'package:my_academy/model/common/lessons/lesson_model.dart';

import '../pagination/pagination_model.dart';

class LessonsModel {
  LessonsModel({
    this.lessons,
    this.pagination,
  });

  List<LessonDetails>? lessons;
  PaginationModel? pagination;

  factory LessonsModel.fromJson(Map<String, dynamic> json) => LessonsModel(
    lessons: List<LessonDetails>.from(
        json["lessons"].map((x) => LessonDetails.fromJson(x))),
    pagination: PaginationModel.fromJson(json["pagination"]),
  );
}
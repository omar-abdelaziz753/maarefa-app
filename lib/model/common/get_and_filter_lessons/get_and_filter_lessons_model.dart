import '../lessons/lesson_model.dart';
import '../pagination/pagination_model.dart';

class GetAndFilterLessonsModel {
  GetAndFilterLessonsModel({
    required this.lessons,
    required this.pagination,
  });

  List<LessonDetails> lessons;
  PaginationModel pagination;

  factory GetAndFilterLessonsModel.fromJson(Map<String, dynamic> json) =>
      GetAndFilterLessonsModel(
        lessons: List<LessonDetails>.from(
            json["lessons"].map((x) => LessonDetails.fromJson(x))),
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}

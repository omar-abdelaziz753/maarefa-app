import 'package:my_academy/model/common/pagination/pagination_model.dart';
import 'package:my_academy/model/user/request_lesson/request_lesson_model.dart';

import '../../provider/home/home_db_response.dart';

class LessonRequestsModel {
  LessonRequestsModel({
    required this.requests,
    required this.pagination,
  });

  List<RequestModel> requests;
  PaginationModel pagination;

  factory LessonRequestsModel.fromJson(Map<String, dynamic> json) =>
      LessonRequestsModel(
        requests: List<RequestModel>.from(
            json["requests"].map((x) => RequestModel.fromJson(x))),
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}

class RequestModel {
  RequestModel({
    this.id,
    this.lesson,
    this.times,
    this.status,
    this.createdAt,
  });
  int? id;
  RequestsLessonModel? lesson;
  List<Time>? times;
  int? status;
  String? createdAt;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["id"],
        lesson: RequestsLessonModel.fromJson(json["lesson"]),
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        status: json["status"],
        createdAt: json["created_at"],
      );
}

class Subject {
  Subject({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
      );
}

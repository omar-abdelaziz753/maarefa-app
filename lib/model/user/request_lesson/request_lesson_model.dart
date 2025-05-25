import 'package:my_academy/model/common/lessons/lesson_model.dart';
import 'package:my_academy/model/common/subjects/subjects_model.dart';

class RequestsLessonModel {
  RequestsLessonModel({
    this.id,
    this.subject,
    this.content,
    this.hourPrice,
    this.provider,
  });

  int? id;
  SubjectModel? subject;
  String? content;
  String? hourPrice;
  Pro? provider;

  factory RequestsLessonModel.fromJson(Map<String, dynamic> json) =>
      RequestsLessonModel(
        id: json["id"],
        subject: SubjectModel.fromJson(json["subject"]),
        content: json["content"],
        hourPrice: json["hour_price"],
        provider: Pro.fromJson(json["provider"]),
      );
}

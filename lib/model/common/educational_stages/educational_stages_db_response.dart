import 'dart:convert';

import 'educational_stages_model.dart';

EducationalStagesDbResponse educationalStagesDbResponseFromJson(String str) => EducationalStagesDbResponse.fromJson(json.decode(str));


class EducationalStagesDbResponse {
  EducationalStagesDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.educationalStage,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  dynamic messages;
  List<EducationalStageModel>? educationalStage;

  factory EducationalStagesDbResponse.fromJson(Map<String, dynamic> json) => EducationalStagesDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    educationalStage: List<EducationalStageModel>.from(json["data"].map((x) => EducationalStageModel.fromJson(x))),
  );
}

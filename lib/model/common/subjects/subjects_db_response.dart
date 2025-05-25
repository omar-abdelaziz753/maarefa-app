import 'dart:convert';

import 'package:my_academy/model/common/subjects/subjects_model.dart';

SubjectsDbResponse subjectsDbResponseFromJson(String str) => SubjectsDbResponse.fromJson(json.decode(str));

class SubjectsDbResponse {
  SubjectsDbResponse({
    this.success,
    this.errorCode,
    this.status,
    this.notificationsCount,
    this.messages,
    this.subject,
  });

  bool? success;
  int? errorCode;
  int? status;
  int? notificationsCount;
  dynamic messages;
  List<SubjectModel>? subject;

  factory SubjectsDbResponse.fromJson(Map<String, dynamic> json) => SubjectsDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    status: json["status"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    subject: List<SubjectModel>.from(json["data"].map((x) => SubjectModel.fromJson(x))),
  );
}


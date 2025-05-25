import 'dart:convert';

import '../courses/course_details/course_details_model.dart';

SpecializationsDbResponse specializationsDbResponseFromJson(String str) =>
    SpecializationsDbResponse.fromJson(json.decode(str));

class SpecializationsDbResponse {
  SpecializationsDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.specialization,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  dynamic messages;
  List<Specialization>? specialization;

  factory SpecializationsDbResponse.fromJson(Map<String, dynamic> json) =>
      SpecializationsDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        specialization: List<Specialization>.from(
            json["data"].map((x) => Specialization.fromJson(x))),
      );
}

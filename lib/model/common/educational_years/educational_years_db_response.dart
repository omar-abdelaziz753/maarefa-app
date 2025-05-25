// To parse this JSON data, do
//
//     final educationalYearsDbResponse = educationalYearsDbResponseFromJson(jsonString);

import 'dart:convert';

import 'package:my_academy/model/common/educational_stages/educational_years_model.dart';


EducationalYearsDbResponse educationalYearsDbResponseFromJson(String str) => EducationalYearsDbResponse.fromJson(json.decode(str));

class EducationalYearsDbResponse {
  EducationalYearsDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.educationalYear,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  dynamic messages;
  List<EducationalYearModel>? educationalYear;

  factory EducationalYearsDbResponse.fromJson(Map<String, dynamic> json) => EducationalYearsDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    educationalYear: List<EducationalYearModel>.from(json["data"].map((x) => EducationalYearModel.fromJson(x))),
  );

}
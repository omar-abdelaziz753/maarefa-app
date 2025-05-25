// import 'dart:convert';
//
// import 'consultations_model.dart';
//
// ConsultationDbResponse consultationDbResponseFromJson(String str) => ConsultationDbResponse.fromJson(json.decode(str));
//
// class ConsultationDbResponse {
//   ConsultationDbResponse({
//     this.success,
//     this.errorCode,
//     this.notificationsCount,
//     this.messages,
//     this.data,
//   });
//
//   bool? success;
//   int? errorCode;
//   int? notificationsCount;
//   dynamic messages;
//   List<ConsultationsModel>? data;
//
//   factory ConsultationDbResponse.fromJson(Map<String, dynamic> json) => ConsultationDbResponse(
//     success: json["success"],
//     errorCode: json["errorCode"],
//     notificationsCount: json["notificationsCount"],
//     messages: json["messages"],
//     data: List<ConsultationsModel>.from(json["data"].map((x) => ConsultationsModel.fromJson(x))),
//   );
// }
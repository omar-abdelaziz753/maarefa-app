
import 'add_request_course_model.dart';



class AddRequestCourseDbResponse {
  AddRequestCourseDbResponse({
    this.success,
    this.errorCode,
    this.status,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? status;
  int? notificationsCount;
  dynamic messages;
  AddRequestCourseModel? data;

  factory AddRequestCourseDbResponse.fromJson(Map<String, dynamic> json) => AddRequestCourseDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    status: json["status"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: AddRequestCourseModel.fromJson(json["data"]),
  );
}



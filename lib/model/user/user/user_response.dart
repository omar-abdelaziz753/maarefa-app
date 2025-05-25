import 'package:my_academy/model/user/user/user_model.dart';

class UserDbResponse {
  UserDbResponse({
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
  UserModel? data;

  factory UserDbResponse.fromJson(Map<String, dynamic> json) => UserDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
      );
}

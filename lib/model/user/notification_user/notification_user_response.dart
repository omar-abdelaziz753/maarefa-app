import 'notification_user_model.dart';

class NotificationsUserResponse {
  NotificationsUserResponse({
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
  NotificationUserModel? data;

  factory NotificationsUserResponse.fromJson(Map<String, dynamic> json) =>
      NotificationsUserResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: NotificationUserModel.fromJson(json["data"]),
      );
}

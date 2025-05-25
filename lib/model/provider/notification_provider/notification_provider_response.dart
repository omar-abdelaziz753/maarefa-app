import 'package:my_academy/model/provider/notification_provider/notification_provider_model.dart';


class NotificationsProviderResponse {
  NotificationsProviderResponse({
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
  NotificationProviderModel? data;

  factory NotificationsProviderResponse.fromJson(Map<String, dynamic> json) => NotificationsProviderResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    status: json["status"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: NotificationProviderModel.fromJson(json["data"]),
  );
}
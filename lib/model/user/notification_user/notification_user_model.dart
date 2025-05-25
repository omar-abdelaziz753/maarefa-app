import '../../common/notifications/notification_model.dart';

class NotificationUserModel {
  NotificationUserModel({
    required this.notifications,
  });

  List<NotificationModel> notifications;

  factory NotificationUserModel.fromJson(Map<String, dynamic> json) => NotificationUserModel(
    notifications: List<NotificationModel>.from(json["notifications"].map((x) => NotificationModel.fromJson(x))),
  );
}
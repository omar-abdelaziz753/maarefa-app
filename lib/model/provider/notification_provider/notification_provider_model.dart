import '../../common/notifications/notification_model.dart';

class NotificationProviderModel {
  NotificationProviderModel({
    required this.notifications,
  });

  List<NotificationModel> notifications;

  factory NotificationProviderModel.fromJson(Map<String, dynamic> json) => NotificationProviderModel(
    notifications: List<NotificationModel>.from(json["notifications"].map((x) => NotificationModel.fromJson(x))),
  );
}
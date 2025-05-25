class NotificationModel {
  NotificationModel({
    this.id,
    this.text,
    this.type,
    this.objectId,
    this.createdAt,
  });

  String? id;
  String? text;
  String? type;
  dynamic objectId;
  String? createdAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    text: json["text"],
    type: json["type"],
    objectId: json["object_id"],
    createdAt: json["created_at"],
  );
}
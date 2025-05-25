import 'groups_courses_model.dart';

class GroupModelDbResponse {
  GroupModelDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.groupModel,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  dynamic messages;
  List<GroupModel>? groupModel;

  factory GroupModelDbResponse.fromJson(Map<String, dynamic> json) =>
      GroupModelDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        groupModel: List<GroupModel>.from(
            json["data"].map((x) => GroupModel.fromJson(x))),
      );
}

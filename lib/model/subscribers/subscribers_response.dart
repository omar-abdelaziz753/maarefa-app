import 'subscribers_model.dart';

class SubscribersDbResponse {
  SubscribersDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  dynamic messages;
  List<SubscribersModel>? data;

  factory SubscribersDbResponse.fromJson(Map<String, dynamic> json) =>
      SubscribersDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: List<SubscribersModel>.from(
            json["data"].map((x) => SubscribersModel.fromJson(x))),
      );
}

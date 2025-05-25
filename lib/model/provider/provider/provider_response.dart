import 'provider_model.dart';

class ProviderDbResponse {
  ProviderDbResponse({
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
  Provider? data;

  factory ProviderDbResponse.fromJson(Map<String, dynamic> json) =>
      ProviderDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: json["data"] == null ? null : Provider.fromJson(json["data"]),
      );
}

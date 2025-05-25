import 'dart:convert';

import 'package:my_academy/model/provider/requests/show_item_requests/show_item_requests_model.dart';

ShowItemRequestDbResponse showItemRequestDbResponseFromJson(String str) => ShowItemRequestDbResponse.fromJson(json.decode(str));

class ShowItemRequestDbResponse {
  ShowItemRequestDbResponse({
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
  ShowItemRequests? data;

  factory ShowItemRequestDbResponse.fromJson(Map<String, dynamic> json) => ShowItemRequestDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: ShowItemRequests.fromJson(json["data"]),
  );
}
import 'dart:convert';

import 'coupon_data.dart';

CheckCouponDbResponse checkCouponDbResponseFromJson(String str) => CheckCouponDbResponse.fromJson(json.decode(str));


class CheckCouponDbResponse {
  CheckCouponDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  String? messages;
  CouponData? data;

  factory CheckCouponDbResponse.fromJson(Map<String, dynamic> json) => CheckCouponDbResponse(
    success: json["success"],
    errorCode: json["errorCode"],
    notificationsCount: json["notificationsCount"],
    messages: json["messages"],
    data: CouponData.fromJson(json['data']),
  );
}

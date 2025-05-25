import '../payment_method_model/payment_method_model.dart';

class PymentMethodDbResponse {
  PymentMethodDbResponse({
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
  String? messages;
  List<PaymentMethodModel>? data;

  factory PymentMethodDbResponse.fromJson(Map<String, dynamic> json) =>
      PymentMethodDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: List<PaymentMethodModel>.from(
            json["data"].map((x) => PaymentMethodModel.fromJson(x))),
      );
}

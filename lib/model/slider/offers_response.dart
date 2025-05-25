import 'slider_model.dart';

class OffersDbResponse {
    OffersDbResponse({
        required this.success,
        required this.errorCode,
        required this.status,
        required this.notificationsCount,
        required this.messages,
        required this.data,
    });

    bool success;
    int errorCode;
    int status;
    int notificationsCount;
    String messages;
    List<SliderModel>? data;

    factory OffersDbResponse.fromJson(Map<String, dynamic> json) => OffersDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: List<SliderModel>.from(json["data"].map((x) => SliderModel.fromJson(x)))
    );
}
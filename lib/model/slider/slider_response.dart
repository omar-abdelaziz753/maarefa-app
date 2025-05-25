import "slider_model.dart";
import "../user/user/user_model.dart";

class SliderDbResponse {
    SliderDbResponse({
        required this.success,
        required this.errorCode,
        required this.status,
        required this.notificationsCount,
        required this.messages,
        required this.data,
    });

    bool? success;
    int? errorCode;
    int? status;
    int? notificationsCount;
    String? messages;
    UserHomeModel? data;

    factory SliderDbResponse.fromJson(Map<String, dynamic> json) => SliderDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: UserHomeModel.fromJson(json["data"]),
    );
}

class UserHomeModel {
    UserHomeModel({
        required this.offers,
        required this.user,
    });

    List<SliderModel>? offers;
    UserModel? user;

    factory UserHomeModel.fromJson(Map<String, dynamic> json) => UserHomeModel(
        offers: List<SliderModel>.from(json["offers"].map((x) => SliderModel.fromJson(x))),
        user: UserModel.fromJson(json["user"]),
    );
}
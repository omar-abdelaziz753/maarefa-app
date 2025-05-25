import 'package:my_academy/model/user/user/user_model.dart';

class AuthModel {
  AuthModel({
    this.user,
    this.token,
  });

  UserModel? user;
  String? token;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    user: UserModel.fromJson(json["user"]),
    token: json["token"],
  );
}
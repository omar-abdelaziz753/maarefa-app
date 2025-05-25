
class ValidateEmailModel {
  ValidateEmailModel({
    this.email,
  });

  String? email;

  factory ValidateEmailModel.fromJson(Map<String, dynamic> json) => ValidateEmailModel(
    email: json["email"],
  );
}

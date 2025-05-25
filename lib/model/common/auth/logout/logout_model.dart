class LogOutModel {
  LogOutModel({
    this.message,
  });

  String? message;

  factory LogOutModel.fromJson(Map<String, dynamic> json) => LogOutModel(
    message: json["message"],
  );
}
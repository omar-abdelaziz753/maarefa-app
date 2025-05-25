class ValidateModel{
  ValidateModel({
    this.code,
    this.email,
    this.classType,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? code;
  String? email;
  String? classType;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory ValidateModel.fromJson(Map<String, dynamic> json) => ValidateModel(
    code: json["code"],
    email: json["email"],
    classType: json["class_type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );
}
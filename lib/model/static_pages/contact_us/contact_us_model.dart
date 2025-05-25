class ContactUsModel {
  ContactUsModel({
    this.name,
    this.phone,
    this.email,
    this.message,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? name;
  String? phone;
  String? email;
  String? message;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    message: json["message"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );
}
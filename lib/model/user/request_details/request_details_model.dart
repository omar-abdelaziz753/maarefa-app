import '../groups_courses/groups_courses_model.dart';
import '../provider/provider_model.dart';

class RequestDetailsModel {
  RequestDetailsModel({
    required this.id,
    required this.course,
    required this.groups,
    required this.status,
    required this.certificated,
    required this.certificateSignedAt,
    required this.certificatePath,
    required this.createdAt,
  });

  int id;
  RequestsCoursesModel course;
  List<GroupModel> groups;
  int status;
  bool certificated;
  String certificateSignedAt;
  String certificatePath;
  String createdAt;

  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) =>
      RequestDetailsModel(
        id: json["id"],
        course: RequestsCoursesModel.fromJson(json["course"]),
        groups: List<GroupModel>.from(
            json["groups"].map((x) => GroupModel.fromJson(x))),
        status: json["status"],
        certificated: json["certificated"],
        certificateSignedAt: json["certificate_signed_at"],
        certificatePath: json["certificate_path"],
        createdAt: json["created_at"],
      );
}

class RequestsCoursesModel {
  RequestsCoursesModel({
    this.id,
    this.name,
    this.content,
    this.type,
    this.image,
    this.numberOfHours,
    required this.provider,
    this.priceWithoutTax,
    this.priceWithTax,
    this.tax,
  });

  int? id;
  String? name;
  String? content;
  int? type;
  String? image;
  int? numberOfHours;
  String? priceWithoutTax;
  String? priceWithTax;
  String? tax;
  Provider provider;
  String get price => priceWithoutTax ?? '';

  factory RequestsCoursesModel.fromJson(Map<String, dynamic> json) =>
      RequestsCoursesModel(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        type: json["type"],
        image: json["image"],
        numberOfHours: json["number_of_hours"],
        priceWithoutTax: (json["price"] ?? '').toString(),
        priceWithTax: (json["price_with_tax"] ?? '').toString(),
        tax: (json["tax"] ?? '').toString(),
        provider: Provider.fromJson(json["provider"]),
      );
}

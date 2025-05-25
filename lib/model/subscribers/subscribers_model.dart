class SubscribersModel {
  SubscribersModel({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
    this.certificated,
    this.requestId,
    this.courseId,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? image;
  bool? certificated;
  int? requestId;
  int? courseId;

  factory SubscribersModel.fromJson(Map<String, dynamic> json) =>
      SubscribersModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        certificated: json["certificated"],
        requestId: json["request_id"],
        courseId: json["course_id"],
      );
}

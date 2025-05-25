class CourseSubscriberModel {
  CourseSubscriberModel({
    this.id,
    this.firstName,
    this.lastName,
    this.certificatePath,
    this.certificated,
    this.requestId,
    this.courseId,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? certificatePath;
  bool? certificated;
  int? requestId;
  int? courseId;

  factory CourseSubscriberModel.fromJson(Map<String, dynamic> json) => CourseSubscriberModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    certificatePath: json["certificate_path"],
    certificated: json["certificated"],
    requestId: json["request_id"],
    courseId: json["course_id"],
  );
}

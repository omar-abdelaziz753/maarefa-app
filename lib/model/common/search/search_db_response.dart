// To parse this JSON data, do
//
//     final searchDbResponse = searchDbResponseFromJson(jsonString);

import '../../provider/home/home_db_response.dart';

class SearchDbResponse {
  SearchDbResponse({
    this.success,
    this.errorCode,
    this.status,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? status;
  int? notificationsCount;
  dynamic messages;
  SearchData? data;

  factory SearchDbResponse.fromJson(Map<String, dynamic> json) =>
      SearchDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: SearchData.fromJson(json["data"]),
      );
}

class SearchData {
  SearchData({
    this.courses,
    this.lessons,
  });

  List<SearchCourse>? courses;
  List<SearchLesson>? lessons;

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        courses: json["courses"] == null
            ? null
            : List<SearchCourse>.from(
                json["courses"].map((x) => SearchCourse.fromJson(x))),
        lessons: json["lessons"] == null
            ? null
            : List<SearchLesson>.from(
                json["lessons"].map((x) => SearchLesson.fromJson(x))),
      );
}

class SearchCourse {
  SearchCourse({
    this.id,
    this.name,
    this.content,
    this.specialization,
    this.provider,
    this.type,
    this.attendanceType,
    this.maxStudents,
    this.location,
    this.videoUrl,
    this.image,
    this.rate,
    this.rateCount,
    this.numberOfHours,
    this.price,
    this.subscriptions,
    this.isBookmarked,
    this.requestsCount,
    this.createdAt,
  });

  int? id;
  String? name;
  String? content;
  Specialization? specialization;
  Provider? provider;
  int? type;
  int? attendanceType;
  int? maxStudents;
  String? location;
  String? videoUrl;
  String? image;
  double? rate;
  int? rateCount;
  int? numberOfHours;
  String? price;
  int? subscriptions;
  bool? isBookmarked;
  int? requestsCount;
  DateTime? createdAt;

  factory SearchCourse.fromJson(Map<String, dynamic> json) => SearchCourse(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        specialization: json["specialization"] == null
            ? null
            : Specialization.fromJson(json["specialization"]),
        provider: json["provider"] == null
            ? null
            : Provider.fromJson(json["provider"]),
        type: json["type"],
        attendanceType: json["attendance_type"],
        maxStudents: json["max_students"],
        location: json["location"],
        videoUrl: json["video_url"],
        image: json["image"],
        rate: (json["rate"] as num).toDouble(),
        rateCount: json["rate_count"],
        numberOfHours: json["number_of_hours"],
        price: json["price"],
        subscriptions: json["subscriptions"],
        isBookmarked: json["is_bookmarked"],
        requestsCount: json["requests_count"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}

class Specialization {
  Specialization({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );
}

class SearchLesson {
  SearchLesson({
    this.id,
    this.educationalStage,
    this.educationalYear,
    this.subject,
    this.content,
    this.hourPrice,
    this.hostUrl,
    this.joinUrl,
    this.times,
    this.subscriptions,
    this.provider,
    this.requestsCount,
    this.isBookmarked,
  });

  int? id;
  EducationalStage? educationalStage;
  EducationalYear? educationalYear;
  EducationalYear? subject;
  String? content;
  String? hourPrice;
  dynamic hostUrl;
  dynamic joinUrl;
  List<Time>? times;
  int? subscriptions;
  Provider? provider;
  int? requestsCount;
  bool? isBookmarked;

  factory SearchLesson.fromJson(Map<String, dynamic> json) => SearchLesson(
        id: json["id"],
        educationalStage: json["educational_stage"] == null
            ? null
            : EducationalStage.fromJson(json["educational_stage"]),
        educationalYear: json["educational_year"] == null
            ? null
            : EducationalYear.fromJson(json["educational_year"]),
        subject: json["subject"] == null
            ? null
            : EducationalYear.fromJson(json["subject"]),
        content: json["content"],
        hourPrice: json["hour_price"],
        hostUrl: json["host_url"],
        joinUrl: json["join_url"],
        times: json["times"] == null
            ? null
            : List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        subscriptions: json["subscriptions"],
        provider: json["provider"] == null
            ? null
            : Provider.fromJson(json["provider"]),
        requestsCount: json["requests_count"],
        isBookmarked: json["is_bookmarked"],
      );
}

class EducationalStage {
  EducationalStage({
    this.id,
    this.name,
    this.educationalYears,
  });

  int? id;
  String? name;
  List<dynamic>? educationalYears;

  factory EducationalStage.fromJson(Map<String, dynamic> json) =>
      EducationalStage(
        id: json["id"],
        name: json["name"],
        educationalYears: json["educational_years"] == null
            ? null
            : List<dynamic>.from(json["educational_years"].map((x) => x)),
      );
}

class EducationalYear {
  EducationalYear({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory EducationalYear.fromJson(Map<String, dynamic> json) =>
      EducationalYear(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Provider {
  Provider({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.image,
    this.bio,
    this.rate,
    this.rateCount,
  });

  int? id;
  String? title;
  String? firstName;
  String? lastName;
  String? image;
  String? bio;
  int? rate;
  int? rateCount;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        bio: json["bio"],
        rate: json["rate"],
        rateCount: json["rate_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "first_name": firstName,
        "last_name": lastName,
        "image_path": image,
        "bio": bio,
        "rate": rate,
        "rate_count": rateCount,
      };
}

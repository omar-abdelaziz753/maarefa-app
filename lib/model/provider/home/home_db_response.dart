import '../../common/courses/course_details/course_details_model.dart';

class HomeDbResponse {
  HomeDbResponse({
    this.success,
    this.errorCode,
    this.status,
    this.notificationsCount,
    this.messages,
    required this.data,
  });

  bool? success;
  int? errorCode;
  int? status;
  int? notificationsCount;
  dynamic messages;
  HomeModel data;

  factory HomeDbResponse.fromJson(Map<String, dynamic> json) => HomeDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: HomeModel.fromJson(json["data"]),
      );
}

class HomeModel {
  HomeModel({
    this.authUser,
    this.currentAction,
    this.courses,
    this.lessons,
  });

  AuthUser? authUser;
  CurrentAction? currentAction;
  List<Course>? courses;
  List<Lesson>? lessons;
  // List<dynamic> consultaions;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        authUser: AuthUser.fromJson(json["authUser"]),
        currentAction: json["currentAction"] == null
            ? null
            : CurrentAction.fromJson(json["currentAction"]),
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
        lessons:
            List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
      );
}

class AuthUser {
  AuthUser({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.imagePath,
  });

  int? id;
  String? title;
  String? firstName;
  String? lastName;
  String? imagePath;

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        id: json["id"],
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        imagePath: json["image_path"],
      );
}

class Course {
  Course({
    this.id,
    this.name,
    this.content,
    this.specialization,
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
    this.nextTime,
    this.provider,
  });

  int? id;
  String? name;
  String? content;
  Specialization? specialization;
  int? type;
  int? attendanceType;
  int? maxStudents;
  String? location;
  String? videoUrl;
  String? image;
  double? rate;
  CourseProvider? provider;
  int? rateCount;
  int? numberOfHours;
  String? price;
  int? subscriptions;
  bool? isBookmarked;
  int? requestsCount;
  DateTime? createdAt;
  String? nextTime;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        provider: CourseProvider.fromJson(json["provider"]),
        specialization: json["specialization"] == null
            ? null
            : Specialization.fromJson(json["specialization"]),
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
        nextTime: json["nextTime"],
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
  dynamic image;

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );
}

class CurrentAction {
  CurrentAction({
    this.item,
    this.timeId,
    this.type,
  });

  dynamic item;
  int? timeId;
  String? type;

  factory CurrentAction.fromJson(Map<String, dynamic> json) => CurrentAction(
        item: json["item"] == null
            ? null
            : json["type"] == "lesson"
                ? Lesson.fromJson(json["item"])
                : Course.fromJson(json["item"]),
        type: json["type"],
        timeId: json["time_id"],
      );
}

class Lesson {
  Lesson({
    this.id,
    this.educationalStage,
    this.educationalYear,
    this.subject,
    this.content,
    this.hourPrice,
    this.isLive,
    this.hostUrl,
    this.joinUrl,
    this.times,
    this.subscriptions,
    this.provider,
    this.requestsCount,
    this.isBookmarked,
    this.nextTime,
  });

  int? id;
  EducationalStage? educationalStage;
  EducationalYear? educationalYear;
  EducationalYear? subject;
  String? content;
  String? hourPrice;
  bool? isLive;
  dynamic hostUrl;
  dynamic joinUrl;
  List<Time>? times;
  int? subscriptions;
  Provider? provider;
  int? requestsCount;
  bool? isBookmarked;
  String? nextTime;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        educationalStage: EducationalStage.fromJson(json["educational_stage"]),
        educationalYear: EducationalYear.fromJson(json["educational_year"]),
        subject: EducationalYear.fromJson(json["subject"]),
        content: json["content"],
        hourPrice: json["hour_price"],
        isLive: json["isLive"],
        hostUrl: json["host_url"],
        joinUrl: json["join_url"],
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        subscriptions: json["subscriptions"],
        provider: Provider.fromJson(json["provider"]),
        requestsCount: json["requests_count"],
        isBookmarked: json["is_bookmarked"],
        nextTime: json["nextTime"],
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
  List<EducationalYear>? educationalYears;

  factory EducationalStage.fromJson(Map<String, dynamic> json) =>
      EducationalStage(
        id: json["id"],
        name: json["name"],
        educationalYears: List<EducationalYear>.from(
            json["educational_years"].map((x) => EducationalYear.fromJson(x))),
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
  double? rate;
  int? rateCount;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        bio: json["bio"],
        rate: (json["rate"] as num).toDouble(),
        rateCount: json["rate_count"],
      );
}

class Time {
  Time({
    this.id,
    this.startsAt,
    this.endsAt,
  });

  int? id;
  DateTime? startsAt;
  DateTime? endsAt;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        id: json["id"],
        startsAt: DateTime.parse(json["starts_at"]),
        endsAt: DateTime.parse(json["ends_at"]),
      );
}

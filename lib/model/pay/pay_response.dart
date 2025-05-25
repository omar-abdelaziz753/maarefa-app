import '../provider/home/home_db_response.dart';
import '../user/groups_courses/duration_model.dart';
import '../user/groups_courses/groups_courses_model.dart';

class PayDbResponse {
  PayDbResponse({
    this.success,
    this.errorCode,
    this.notificationsCount,
    this.messages,
    this.data,
  });

  bool? success;
  int? errorCode;
  int? notificationsCount;
  String? messages;
  PayModel? data;

  factory PayDbResponse.fromJson(Map<String, dynamic> json) => PayDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: PayModel.fromJson(json["data"]),
      );
}

class PayModel {
  PayModel({
    this.id,
    this.lesson,
    this.times,
    this.course,
    this.groups,
    this.status,
    this.createdAt,
  });

  int? id;
  Lesson? lesson;
  List<Time>? times;
  Course? course;
  List<GroupModel>? groups;
  int? status;
  DateTime? createdAt;

  factory PayModel.fromJson(Map<String, dynamic> json) => PayModel(
        id: json["id"],
        lesson: json["lesson"] == null ? null : Lesson.fromJson(json["lesson"]),
        times: json["times"] == null
            ? null
            : List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
        groups: json["groups"] == null
            ? null
            : List<GroupModel>.from(
                json["groups"].map((x) => GroupModel.fromJson(x))),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}

class Course {
  Course({
    this.id,
    this.name,
    this.content,
    this.type,
    this.image,
    this.numberOfHours,
    this.priceWithoutTax,
    this.priceWithTax,
    this.tax,
    this.provider,
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
  Provider? provider;

  String get price => priceWithoutTax ?? '';

  factory Course.fromJson(Map<String, dynamic> json) => Course(
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

class Provider {
  Provider({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
  });

  int? id;
  String? title;
  String? firstName;
  String? lastName;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );
}

class Group {
  Group({
    this.id,
    this.startFrom,
    this.start,
    this.end,
    this.durationInMonths,
    this.duration,
  });

  int? id;
  DateTime? startFrom;
  End? start;
  End? end;
  int? durationInMonths;
  DurationModel? duration;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        startFrom: DateTime.parse(json["start_from"]),
        start: End.fromJson(json["start"]),
        end: End.fromJson(json["end"]),
        duration: json["duration"] == null
            ? null
            : DurationModel.fromJson(json["duration"]),
        durationInMonths: json["durationInMonths"],
      );
}

class End {
  End({
    this.date,
    this.dayOfWeek,
    this.times,
  });

  DateTime? date;
  String? dayOfWeek;
  List<String>? times;

  factory End.fromJson(Map<String, dynamic> json) => End(
        date: DateTime.parse(json["date"]),
        dayOfWeek: json["dayOfWeek"],
        times: List<String>.from(json["times"].map((x) => x)),
      );
}

class Lesson {
  Lesson({
    this.id,
    this.subject,
    this.content,
    this.priceWithoutTax,
    this.provider,
    required this.finalPriceWithTax,
    required this.tax,
  });

  final int? id;
  final Subject? subject;
  final String? content;
  final String? priceWithoutTax;
  final String? tax;
  final String? finalPriceWithTax;
  final Provider? provider;

  String get price => priceWithoutTax ?? '';

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        subject: Subject.fromJson(json["subject"]),
        content: json["content"],
        priceWithoutTax: (json["hour_price"] ?? '').toString(),
        finalPriceWithTax: (json["price_with_tax"] ?? '').toString(),
        tax: (json["tax"] ?? '').toString(),
        provider: Provider.fromJson(json["provider"]),
      );
}

class Subject {
  Subject({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
      );
}

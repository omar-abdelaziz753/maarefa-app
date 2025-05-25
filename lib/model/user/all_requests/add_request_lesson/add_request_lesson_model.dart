import '../../../provider/home/home_db_response.dart';

class AddRequestLessonModel {
  AddRequestLessonModel({
    this.id,
    this.lesson,
    this.times,
    this.status,
    this.createdAt,
  });

  int? id;
  Lesson? lesson;
  List<Time>? times;
  int? status;
  DateTime? createdAt;

  factory AddRequestLessonModel.fromJson(Map<String, dynamic> json) =>
      AddRequestLessonModel(
        id: json["id"],
        lesson: Lesson.fromJson(json["lesson"]),
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}

class Lesson {
  Lesson({
    this.id,
    this.subject,
    this.content,
    this.hourPrice,
    this.provider,
  });

  int? id;
  Subject? subject;
  String? content;
  String? hourPrice;
  Provider? provider;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        subject: Subject.fromJson(json["subject"]),
        content: json["content"],
        hourPrice: json["hour_price"],
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "first_name": firstName,
        "last_name": lastName,
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

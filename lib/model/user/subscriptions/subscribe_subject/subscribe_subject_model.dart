import '../../../provider/home/home_db_response.dart';

class SubscribeSubjectModel {
  SubscribeSubjectModel({
    required this.liveSubscription,
    required this.subscriptions,
    this.pagination,
  });

  List<Subscription> liveSubscription;
  List<Subscription> subscriptions;
  Pagination? pagination;

  factory SubscribeSubjectModel.fromJson(Map<String, dynamic> json) =>
      SubscribeSubjectModel(
        liveSubscription: List<Subscription>.from(
            json["liveSubscription"].map((x) => Subscription.fromJson(x))),
        subscriptions: List<Subscription>.from(
            json["subscriptions"].map((x) => Subscription.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );
}

class Subscription {
  Subscription({
    required this.id,
    required this.lesson,
    this.times,
    this.status,
    this.createdAt,
    this.currentTimeId,
  });

  int id;
  Lesson lesson;
  List<Time>? times;
  int? status;
  int? currentTimeId;
  DateTime? createdAt;
  DateTime? cresubscribeSubjectModelatedAt;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
        lesson: Lesson.fromJson(json["lesson"]),
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        status: json["status"],
        currentTimeId: json["current_time_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}

class Lesson {
  Lesson({
    required this.id,
    this.subject,
    this.content,
    this.hourPrice,
    required this.provider,
  });

  int id;
  Subject? subject;
  String? content;
  String? hourPrice;
  Provider provider;

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
    required this.id,
    this.title,
    this.firstName,
    this.lastName,
  });

  int id;
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

class Pagination {
  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.hasMorePages,
  });

  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  bool? hasMorePages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        hasMorePages: json["has_more_pages"],
      );
}

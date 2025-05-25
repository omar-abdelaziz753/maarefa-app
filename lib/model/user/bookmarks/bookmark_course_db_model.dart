import 'package:my_academy/model/common/search/search_db_response.dart';

class BookmarkCoursesModel {
  BookmarkCoursesModel({
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
    this.provider,
    this.createdAt,
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
  int? rateCount;
  int? numberOfHours;
  String? price;
  Provider? provider;
  int? subscriptions;
  bool? isBookmarked;
  DateTime? createdAt;

  factory BookmarkCoursesModel.fromJson(Map<String, dynamic> json) =>
      BookmarkCoursesModel(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        specialization: Specialization.fromJson(json["specialization"]),
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
        provider: json["provider"] == null
            ? null
            : Provider.fromJson(json["provider"]),
        subscriptions: json["subscriptions"],
        isBookmarked: json["is_bookmarked"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "specialization": specialization!.toJson(),
        "type": type,
        "attendance_type": attendanceType,
        "max_students": maxStudents,
        "location": location,
        "video_url": videoUrl,
        "image": image,
        "rate": rate,
        "rate_count": rateCount,
        "number_of_hours": numberOfHours,
        "price": price,
        "subscriptions": subscriptions,
        "is_bookmarked": isBookmarked,
        "created_at":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

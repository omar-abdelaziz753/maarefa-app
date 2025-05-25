import 'package:my_academy/model/common/courses/course_details/course_details_model.dart';
import 'package:my_academy/model/common/lessons/lesson_model.dart';

import '../../provider/provider/provider_model.dart';

class ShowProvidersModel {
  ShowProvidersModel({
    this.provider,
    this.courses,
    this.lessons,
    // this.consultations,
  });

  Provider? provider;
  List<ProviderCourses>? courses;
  List<LessonDetails>? lessons;
  // List<dynamic>? consultations;

  factory ShowProvidersModel.fromJson(Map<String, dynamic> json) =>
      ShowProvidersModel(
        provider: Provider.fromJson(json["provider"]),
        courses: List<ProviderCourses>.from(
            json["courses"].map((x) => ProviderCourses.fromJson(x))),
        lessons: List<LessonDetails>.from(
            json["lessons"].map((x) => LessonDetails.fromJson(x))),
        // consultations: List<dynamic>.from(json["consultations"].map((x) :> x)),
      );
}

class ProviderCourses {
  ProviderCourses({
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
    this.provider,
    this.subscriptions,
    this.isBookmarked,
    this.createdAt,
    this.priceWithoutTax,
    this.tax,
    this.finalPriceWithTax,
  });

  final int? id;
  final String? name;
  final String? content;
  final Specialization? specialization;
  final int? type;
  final int? attendanceType;
  final int? maxStudents;
  final String? location;
  final String? videoUrl;
  final String? image;
  final double? rate;
  final int? rateCount;
  final int? numberOfHours;
  final String? price;
  final Provider? provider;
  final int? subscriptions;
  final bool? isBookmarked;
  final String? createdAt;
  final String? priceWithoutTax;
  final String? tax;
  final String? finalPriceWithTax;

  factory ProviderCourses.fromJson(Map<String, dynamic> json) =>
      ProviderCourses(
        id: json['id'],
        name: json['name'],
        content: json['content'],
        specialization: Specialization.fromJson(json['specialization']),
        type: json['type'],
        attendanceType: json['attendance_type'],
        maxStudents: json['max_students'],
        location: json['location'],
        videoUrl: json['video_url'],
        image: json['image'],
        rate: (json["rate"] as num).toDouble(),
        rateCount: json['rate_count'],
        numberOfHours: json['number_of_hours'],
        price: json['price'],
        provider: json["provider"] == null
            ? null
            : Provider.fromJson(json["provider"]),
        subscriptions: json['subscriptions'],
        isBookmarked: json['is_bookmarked'],
        createdAt: json['created_at'],
        priceWithoutTax: (json["hour_price"] ?? '').toString(),
        finalPriceWithTax: (json["price_with_tax"] ?? '').toString(),
        tax: (json["tax"] ?? '').toString(),
      );
}

// class Specialization {
//   Specialization({
//     this.id,
//     this.name,
//     this.image,
//   });
//   final int id;
//   final String name;
//   final String image;
//
//   Specialization.fromJson(Map<String, dynamic> json){
//     id : json['id'];
//     name : json['name'];
//     image : json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data : <String, dynamic>{};
//     _data['id'] : id;
//     _data['name'] : name;
//     _data['image'] : image;
//     return _data;
//   }
// }
import '../../provider/home/home_db_response.dart';
import '../educational_stages/educational_stages_model.dart';
import '../educational_stages/educational_years_model.dart';

class LessonDetails {
  LessonDetails({
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
    this.isBookmarked,
    this.requestsCount,
    this.priceWithoutTax,
    this.tax,
    this.finalPriceWithTax,
  });

  int? id;
  EducationalStageModel? educationalStage;
  EducationalYearModel? educationalYear;
  EducationalYearModel? subject;
  String? content;
  String? hourPrice;
  dynamic hostUrl;
  dynamic joinUrl;
  List<Time>? times;
  int? subscriptions;
  ProviderDetails? provider;
  bool? isBookmarked;
  int? requestsCount;

  final String? priceWithoutTax;
  final String? tax;
  final String? finalPriceWithTax;

  factory LessonDetails.fromJson(Map<String, dynamic> json) => LessonDetails(
        id: json["id"],
        educationalStage:
            EducationalStageModel.fromJson(json["educational_stage"]),
        educationalYear:
            EducationalYearModel.fromJson(json["educational_year"]),
        subject: EducationalYearModel.fromJson(json["subject"]),
        content: json["content"],
        hourPrice: json["hour_price"],
        hostUrl: json["host_url"],
        joinUrl: json["join_url"],
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        subscriptions: json["subscriptions"],
        provider: ProviderDetails.fromJson(json["provider"]),
        isBookmarked: json["is_bookmarked"],
        requestsCount: json["requests_count"],
        priceWithoutTax: (json["hour_price"] ?? '').toString(),
        finalPriceWithTax: (json["price_with_tax"] ?? '').toString(),
        tax: (json["tax"] ?? '').toString(),
      );
}

class ProviderDetails {
  ProviderDetails({
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

  factory ProviderDetails.fromJson(Map<String, dynamic> json) =>
      ProviderDetails(
          id: json["id"],
          title: json["title"],
          firstName: json["first_name"],
          lastName: json["last_name"],
          image: json["image_path"] ?? "",
          bio: json["bio"] ?? "",
          rate: (json["rate"] as num).toDouble(),
          rateCount: json['rate_count'] ?? "");
}

class Pro {
  Pro({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
  });

  int? id;
  String? title;
  String? firstName;
  String? lastName;

  factory Pro.fromJson(Map<String, dynamic> json) => Pro(
        id: json["id"],
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );
}

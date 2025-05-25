import 'package:my_academy/model/common/educational_stages/educational_stages_model.dart';
import 'package:my_academy/model/common/educational_stages/educational_years_model.dart';

import '../../common/lessons/lesson_model.dart';
import '../../provider/home/home_db_response.dart';

class BookmarkLessonsModel {
  BookmarkLessonsModel({
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

  factory BookmarkLessonsModel.fromJson(Map<String, dynamic> json) =>
      BookmarkLessonsModel(
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
      );
}

class BookmarksLessons {
  BookmarksLessons({
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
  Provider? provider;
  bool? isBookmarked;

  factory BookmarksLessons.fromJson(Map<String, dynamic> json) =>
      BookmarksLessons(
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
        provider: Provider.fromJson(json["provider"]),
        isBookmarked: json["is_bookmarked"],
      );
}

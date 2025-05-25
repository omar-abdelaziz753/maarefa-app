import '../../../common/pagination/pagination_model.dart';
import '../../groups_courses/groups_courses_model.dart';
import '../../request_details/request_details_model.dart';

class SubscribeCourseModel {
  SubscribeCourseModel({
    this.liveSubscription,
    required this.subscriptions,
    required this.pagination,
  });

  List<SubscriptionCourse>? liveSubscription;
  List<SubscriptionCourse> subscriptions;
  PaginationModel pagination;

  factory SubscribeCourseModel.fromJson(Map<String, dynamic> json) =>
      SubscribeCourseModel(
        liveSubscription: json["liveSubscription"] == null
            ? null
            : List<SubscriptionCourse>.from(json["liveSubscription"]
                .map((x) => SubscriptionCourse.fromJson(x))),
        subscriptions: List<SubscriptionCourse>.from(
            json["subscriptions"].map((x) => SubscriptionCourse.fromJson(x))),
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}

class SubscriptionCourse {
  SubscriptionCourse({
    required this.id,
    required this.course,
    this.groups,
    this.status,
    this.certificated,
    this.certificateSignedAt,
    this.certificatePath,
    this.createdAt,
    this.currentTimeId,
  });

  int id;
  RequestsCoursesModel course;
  List<GroupModel>? groups;
  int? currentTimeId;
  int? status;
  bool? certificated;
  String? certificateSignedAt;
  String? certificatePath;
  String? createdAt;

  factory SubscriptionCourse.fromJson(Map<String, dynamic> json) =>
      SubscriptionCourse(
        id: json["id"],
        course: RequestsCoursesModel.fromJson(json["course"]),
        groups: List<GroupModel>.from(
            json["groups"].map((x) => GroupModel.fromJson(x))),
        status: json["status"],
        currentTimeId: json["current_time_id"],
        certificated: json["certificated"],
        certificateSignedAt: json["certificate_signed_at"],
        certificatePath: json["certificate_path"],
        createdAt: json["created_at"],
      );
}

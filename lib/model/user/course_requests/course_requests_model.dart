import 'package:my_academy/model/common/pagination/pagination_model.dart';

import '../request_details/request_details_model.dart';

class CoursesRequestsModel {
  CoursesRequestsModel({
    required this.requests,
    required this.pagination,
  });
  List<RequestDetailsModel> requests;
  PaginationModel pagination;

  factory CoursesRequestsModel.fromJson(Map<String, dynamic> json) => CoursesRequestsModel(
    requests: List<RequestDetailsModel>.from(json["requests"].map((x) => RequestDetailsModel.fromJson(x))),
    pagination: PaginationModel.fromJson(json["pagination"]),
  );
}
import '../../../common/pagination/pagination_model.dart';

class ItemsRequestDetailsModel {
  ItemsRequestDetailsModel({
    this.requests,
    this.pagination,
  });

  List<dynamic>? requests;
  PaginationModel? pagination;

  factory ItemsRequestDetailsModel.fromJson(Map<String, dynamic> json) =>
      ItemsRequestDetailsModel(
        requests: List<dynamic>.from(json["requests"].map((x) => x)),
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}

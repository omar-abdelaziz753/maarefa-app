import '../../../common/pagination/pagination_model.dart';
import '../requests_model/requests_model.dart';

class ShowItemRequests {
  ShowItemRequests({
    this.requests,
    this.pagination,
  });

  List<Request>? requests;
  PaginationModel? pagination;

  factory ShowItemRequests.fromJson(Map<String, dynamic> json) =>
      ShowItemRequests(
        requests: List<Request>.from(
            json["requests"].map((x) => Request.fromJson(x))),
        pagination: PaginationModel.fromJson(json["pagination"]),
      );
}

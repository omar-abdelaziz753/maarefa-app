class PaginationModel {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  bool? hasMorePages;

  PaginationModel(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages,
      this.hasMorePages});

  PaginationModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    hasMorePages = json['has_more_pages'];
  }
}

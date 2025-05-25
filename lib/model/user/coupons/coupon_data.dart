class CouponData {
  CouponData({
    required this.id,
    required this.code,
    required this.usagesLeft,
    required this.discount,
    required this.multiUse,
    required this.expiredAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String code;
  late final int usagesLeft;
  late final int discount;
  late final int multiUse;
  late final String expiredAt;
  late final String createdAt;
  late final String updatedAt;

  CouponData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    usagesLeft = json['usages_left'];
    discount = json['discount'];
    multiUse = json['multi_use'];
    expiredAt = json['expired_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
class PaymentMethodModel {
  PaymentMethodModel({
    this.id,
    this.nameEn,
    this.nameAr,
    this.index,
    this.image,
  });

  int? id;
  String? nameEn;
  String? nameAr;
  String? index;
  String? image;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        index: json["index"],
        image: json["image"],
      );
}

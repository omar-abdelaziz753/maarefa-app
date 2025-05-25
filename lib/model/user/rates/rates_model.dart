class RateModel {
  RateModel({
    this.rate,
  });

  String? rate;

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
    rate: json["rate"],
  );
}

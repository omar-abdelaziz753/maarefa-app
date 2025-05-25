class DurationModel {
  DurationModel({
    required this.number,
    required this.type,
  });

  int number;
  String type;

  factory DurationModel.fromJson(Map<String, dynamic> json) => DurationModel(
        number: json["number"],
        type: json["type"],
      );
}

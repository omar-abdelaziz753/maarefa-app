class EducationalYearModel {
  EducationalYearModel({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory EducationalYearModel.fromJson(Map<String, dynamic> json) =>
      EducationalYearModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );
}

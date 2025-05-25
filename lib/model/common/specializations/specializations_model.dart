class SpecializationsModel {
  SpecializationsModel({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory SpecializationsModel.fromJson(Map<String, dynamic> json) => SpecializationsModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );
}
class NationalityModel {
  NationalityModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;


  factory NationalityModel.fromJson(Map<String, dynamic> json) => NationalityModel(
    id: json["id"],
    name: json["name"],
  );
}

class SubjectModel{
  SubjectModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    id: json["id"],
    name: json["name"],
  );
}
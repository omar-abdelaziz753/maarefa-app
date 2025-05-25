class StaticScreensModel {
  StaticScreensModel({
    // this.id,
    this.name,
    this.content,
  });

  // int? id;
  String? name;
  String? content;

  factory StaticScreensModel.fromJson(Map<String, dynamic> json) => StaticScreensModel(
    // id: json["id"],
    name: json["name"],
    content: json["content"],
  );
}
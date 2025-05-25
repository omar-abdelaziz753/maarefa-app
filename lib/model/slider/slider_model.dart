class SliderModel {
  int? id;
  String? name;
  String? content;
  bool? showInHome;
  String? image;

  SliderModel({this.id, this.name, this.content, this.showInHome, this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        showInHome: json["show_in_home"],
        image: json["image"],
      );
}

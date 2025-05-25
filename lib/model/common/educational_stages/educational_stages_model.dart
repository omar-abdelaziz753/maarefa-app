import 'educational_years_model.dart';

///1
class EducationalStageModel {
  EducationalStageModel({
    this.id,
    this.name,
    this.image,
    this.educationalYears,
  });

  int? id;
  String? name;
  String? image;
  List<EducationalYearModel>? educationalYears;

  factory EducationalStageModel.fromJson(Map<String, dynamic> json) =>
      EducationalStageModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        educationalYears: List<EducationalYearModel>.from(
            json["educational_years"]
                .map((x) => EducationalYearModel.fromJson(x))),
      );
}

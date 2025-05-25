import '../../common/end/end_model.dart';
import 'duration_model.dart';

class GroupModel {
  GroupModel({
    this.id,
    this.startFrom,
    this.start,
    this.end,
    this.duration,
    this.durationInMonths,
  });

  int? id;
  DateTime? startFrom;
  End? start;
  End? end;
  DurationModel? duration;
  int? durationInMonths;

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        id: json["id"],
        startFrom: DateTime.parse(json["start_from"]),
        start: End.fromJson(json["start"]),
        end: End.fromJson(json["end"]),
        duration: json["duration"] == null
            ? null
            : DurationModel.fromJson(json["duration"]),
        durationInMonths: json["durationInMonths"],
      );
}

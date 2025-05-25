import 'dart:convert';

class DateModel {
  String day;
  String time;
  DateModel({
    this.day = '',
    this.time = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'time': time,
    };
  }

  static DateModel fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;

    return DateModel(
      day: map['day'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  static DateModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'DateModel(day: $day, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DateModel && other.day == day && other.time == time;
  }

  @override
  int get hashCode {
    return day.hashCode ^ time.hashCode;
  }
}

class End {
  End({
    required this.date,
    required this.dayOfWeek,
    required this.time,
    required this.times,
  });

  DateTime date;
  String dayOfWeek;
  String time;
  List<String> times;

  factory End.fromJson(Map<String, dynamic> json) => End(
        date: DateTime.parse(json["date"]),
        dayOfWeek: json["dayOfWeek"],
        time: json["time"] ?? "",
        times: List<String>.from(json["times"].map((x) => x)),
      );
}

class Provider {
  Provider({
    required this.id,
    this.title,
    this.firstName,
    this.lastName,
  });

  int id;
  String? title;
  String? firstName;
  String? lastName;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );
}

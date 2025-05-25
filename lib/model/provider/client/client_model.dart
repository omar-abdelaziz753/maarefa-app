class Client {
  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? image;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    image: json["image"],
  );
}
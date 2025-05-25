import '../../common/cities/city_model.dart';
import '../../common/nationalities/nationality_model.dart';

class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
    this.city,
    this.nationality,
    this.gender,
    this.birthDate,
    this.wallet,
    this.provider,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;
  CityModel? city;
  NationalityModel? nationality;
  int? gender;
  DateTime? birthDate;
  double? wallet;
  String? provider;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
        nationality: json["nationality"] == null
            ? null
            : NationalityModel.fromJson(json["nationality"]),
        gender: json["gender"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        wallet: double.tryParse(json["wallet"].toString()) ?? 0,
        provider: json["provider"],
      );
}

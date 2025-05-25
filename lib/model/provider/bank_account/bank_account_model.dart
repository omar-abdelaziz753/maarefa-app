class BankAccountModel {
  BankAccountModel(
      {this.id,
      this.swiftCode,
      this.address,
      this.bankName,
      this.cityId,
      this.iban});

  int? id;
  String? swiftCode;
  String? bankName;
  String? address;
  String? iban;
  int? cityId;

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      BankAccountModel(
        id: json["id"],
        swiftCode: json["swift_code"],
        bankName: json["bank_name"],
        iban: json["iban"],
        address: json["address"],
        cityId: json["city_id"],
      );
}

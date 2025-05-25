class CertificateModel {
  CertificateModel({
    required this.id,
    required this.url,
  });

  int id;
  String url;

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      CertificateModel(
        id: json["id"],
        url: json["url"],
      );
}

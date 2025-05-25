import 'certificate_model.dart';

class CertificateData {
  CertificateData({
    required this.certificates,
  });

  List<CertificateModel> certificates;

  factory CertificateData.fromJson(Map<String, dynamic> json) =>
      CertificateData(
        certificates: List<CertificateModel>.from(
            json["certificates"].map((x) => CertificateModel.fromJson(x))),
      );
}

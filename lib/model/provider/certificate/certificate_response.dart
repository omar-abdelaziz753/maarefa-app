import 'certificate_data.dart';

class CertificateDbResponse {
  CertificateDbResponse({
    required this.success,
    required this.errorCode,
    required this.status,
    required this.notificationsCount,
    required this.messages,
    required this.data,
  });

  bool success;
  int errorCode;
  int status;
  int notificationsCount;
  String messages;
  CertificateData data;

  factory CertificateDbResponse.fromJson(Map<String, dynamic> json) =>
      CertificateDbResponse(
        success: json["success"],
        errorCode: json["errorCode"],
        status: json["status"],
        notificationsCount: json["notificationsCount"],
        messages: json["messages"],
        data: CertificateData.fromJson(json["data"]),
      );
}

import 'package:my_academy/model/provider/client/client_model.dart';

class ChangeRequestStatus {
  ChangeRequestStatus({
    this.id,
    this.client,
    this.type,
    this.status,
    this.rejectReason,
  });

  int? id;
  Client? client;
  String? type;
  int? status;
  String? rejectReason;

  factory ChangeRequestStatus.fromJson(Map<String, dynamic> json) => ChangeRequestStatus(
    id: json["id"],
    client: Client.fromJson(json["client"]),
    type: json["type"],
    status: json["status"],
    rejectReason: json["reject_reason"],
  );

}
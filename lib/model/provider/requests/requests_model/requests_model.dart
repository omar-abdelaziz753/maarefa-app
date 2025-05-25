import 'package:my_academy/model/provider/client/client_model.dart';

class Request {
  Request({
    this.id,
    this.client,
    this.type,
    this.status,
    this.rejectReason,
    this.createdAt,
  });

  int? id;
  Client? client;
  String? type;
  int? status;
  String? rejectReason;
  String? createdAt;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        client: Client.fromJson(json["client"]),
        type: json["type"],
        status: json["status"],
        rejectReason: json["reject_reason"],
        createdAt: json["created_at"],
      );
}

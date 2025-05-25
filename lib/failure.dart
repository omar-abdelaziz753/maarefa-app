import 'package:easy_localization/easy_localization.dart';

class Failure implements Exception {
  final String? message;
  final int? code;

  Failure([this.message, this.code]);

  @override
  String toString() {
    return message ?? tr("an_error_occurred");
  }
}
import 'package:dartz/dartz.dart';

import '../../../failure.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class SettingsRepository {
  Future<Either<Failure, String>> getCvNote() async {
    try {
      String note = "";
      final response = await DioService().get('/hint-cv');
      response.fold((l) => showToast("$l"), (r) {
        note = r['data']["value"];
      });
      return right(note);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

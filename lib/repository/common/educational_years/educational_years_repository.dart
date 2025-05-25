import 'package:flutter/cupertino.dart';

import '../../../model/common/educational_years/educational_years_db_response.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class EducationalYearsRepository {
  Future<EducationalYearsDbResponse> getEducationalYears(int id) async {
    try {
      EducationalYearsDbResponse? educationalYearsDbResponse;

      final response =
          await DioService().get('/educational_years?educational_stage_id=$id');
      response.fold((l) => showToast(l), (r) {
        educationalYearsDbResponse = EducationalYearsDbResponse.fromJson(r);
      });
      return educationalYearsDbResponse!;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }
}

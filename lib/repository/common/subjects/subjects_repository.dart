import 'package:flutter/cupertino.dart';
import 'package:my_academy/model/common/subjects/subjects_db_response.dart';

import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class SubjectsRepository {
  // getSubjects(String code) async {
  //   try {
  //     return await DioService()
  //         .get('/clients/coupons/checkCoupon?code=$code')
  //         .then((value) => value.fold((l) => showToast(l), (r) {
  //       SubjectsDbResponse subjects =
  //       SubjectsDbResponse.fromJson(r);
  //       return subjects;
  //     }));
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
  getSubjects({required int yearId, required int stageId}) async {
    try {
      return await DioService()
          .get(
              '/subjects?educational_year_id=$yearId&educational_stage_id=$stageId')
          .then((value) => value.fold((l) => showToast(l), (r) {
                SubjectsDbResponse subjects = SubjectsDbResponse.fromJson(r);
                return subjects;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

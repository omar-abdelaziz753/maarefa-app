import 'package:flutter/cupertino.dart';

import '../../../model/common/get_and_filter_lessons/get_and_filter_lessons_response.dart';
import '../../../model/common/lessons/lesson_db_response.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class LessonsRepository {
  Future<AllLessonsDbResponse> getLessons(
      {required int stageId,
      required int yearId,
      required int page,
      int? subjectId,
      String? sort,
      Map<String, dynamic>? filter}) async {
    try {
      AllLessonsDbResponse? lessons;
      final res = await DioService().get(
          subjectId == null
              ? "/clients/lessons?educational_stage_id=$stageId&page=$page&educational_year_id=$yearId&sortBy=${sort ?? ""}"
              : '/clients/lessons?educational_stage_id=$stageId&page=$page&educational_year_id=$yearId&subject_id=$subjectId&sortBy=${sort ?? ""}',
          queryParams: filter);
      res.fold((l) => showToast(l), (r) {
        lessons = AllLessonsDbResponse.fromJson(r);
      });
      return lessons!;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }

  getLessonsBySubjectId({
    required int stageId,
    required int yearId,
    required int subjectId,
  }) async {
    try {
      return await DioService()
          .get(
              '/clients/lessons?educational_stage_id=$stageId&educational_year_id=$yearId&subject_id=$subjectId')
          .then((value) {
        return value.fold((l) => showToast(l), (r) {
          AllLessonsDbResponse lessons = AllLessonsDbResponse.fromJson(r);

          return lessons;
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  showLessons(int id) async {
    try {
      return await DioService()
          .get('/clients/lessons/$id/show')
          .then((value) => value.fold((l) => showToast(l), (r) {
                LessonDetailsDbResponse showLessons =
                    LessonDetailsDbResponse.fromJson(r);
                return showLessons;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

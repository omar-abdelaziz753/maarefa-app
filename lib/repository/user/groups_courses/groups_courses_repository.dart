import 'package:flutter/cupertino.dart';

import '../../../model/user/groups_courses/groups_courses_db_response.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class GroupModelRepository {
  groupsCourses(int id) async {
    try {
      return await DioService()
          .get('/clients/courses/$id/groups')
          .then((value) => value.fold((l) => showToast(l), (r) {
                GroupModelDbResponse groupModel =
                    GroupModelDbResponse.fromJson(r);
                return groupModel;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

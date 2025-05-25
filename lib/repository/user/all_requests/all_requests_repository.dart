import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/user/course_requests/course_requests_response.dart';
import '../../../model/user/lesson_requests/lesson_requests_response.dart';
import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class AllRequestsRepository {
  SharedPrefService prefService = SharedPrefService();
  // allRequests(String type) async {
  //   try {
  //     return await DioService()
  //         .get('/clients/requests?type=$type')
  //         .then((value) => value.fold((l) => showToast(l), (r) {
  //       AllRequestsDbResponse allRequests =
  //       AllRequestsDbResponse.fromJson(r);
  //       return allRequests;
  //     }));
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
  coursesRequests() async {
    try {
      return await DioService()
          .get('/clients/requests?type=course')
          .then((value) => value.fold((l) => showToast(l), (r) {
                prefService.setValue("requests_course", json.encode(r));
                CoursesRequestsDbResponse courseRequests =
                    CoursesRequestsDbResponse.fromJson(r);
                return courseRequests;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  coursesRequestsCache() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('requests_course')) {
      var response = prefs.getString('requests_course');
      CoursesRequestsDbResponse courseRequests =
          CoursesRequestsDbResponse.fromJson(json.decode(response!));
      return courseRequests;
    }
  }

  lessonsRequests() async {
    try {
      return await DioService()
          .get('/clients/requests?type=lesson')
          .then((value) => value.fold((l) => showToast(l), (r) {
                prefService.setValue("requests_lesson", json.encode(r));
                LessonRequestsResponse lessonRequests =
                    LessonRequestsResponse.fromJson(r);
                debugPrint("this is $lessonRequests ");
                return lessonRequests;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  lessonsRequestsCache() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('requests_lesson')) {
      var response = prefs.getString('requests_lesson');
      LessonRequestsResponse lessonRequests =
          LessonRequestsResponse.fromJson(json.decode(response!));
      return lessonRequests;
    }
  }
}

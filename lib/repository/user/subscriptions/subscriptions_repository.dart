import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_academy/model/user/subscriptions/subscribe_course/subscribe_course_response.dart';
import '../../../model/user/subscriptions/subscribe_subject/subscribe_subject_response.dart';
import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class SubscriptionsRepository {
  SharedPrefService prefService = SharedPrefService();

  subscriptionsCourse(String status) async {
    try {
      return await DioService()
          .get(status == ""
              ? "/clients/subscriptions?type=course"
              : '/clients/subscriptions?status=$status&type=course')
          .then((value) => value.fold((l) => showToast(l), (r) {
                prefService.setValue("subscribe_course", json.encode(r));
                SubscribeCourseResponse courseSubscriptions =
                    SubscribeCourseResponse.fromJson(r);
                return courseSubscriptions;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  subscriptionsCourseCache(String status) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('subscribe_course')) {
      var response = prefs.getString('subscribe_course');
      SubscribeCourseResponse courseSubscriptions =
          SubscribeCourseResponse.fromJson(json.decode(response!));
      return courseSubscriptions;
    }
  }

  subscriptionsSubject(String status) async {
    try {
      return await DioService()
          .get(status == ""
              ? "/clients/subscriptions?type=lesson"
              : '/clients/subscriptions?status=$status&type=lesson')
          .then((value) => value.fold((l) => showToast(l), (r) {
                prefService.setValue("subscribe_lesson", json.encode(r));
                SubscribeLessonResponse subjectSubscriptions =
                    SubscribeLessonResponse.fromJson(r);
                return subjectSubscriptions;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  subscriptionsSubjectCache(String status) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('subscribe_lesson')) {
      var response = prefs.getString('subscribe_lesson');
      SubscribeLessonResponse userResponse =
          SubscribeLessonResponse.fromJson(json.decode(response!));
      return userResponse;
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/common/courses/course_details/course_details_db_response.dart';
import '../../../model/common/courses/courses_model.dart';
import '../../../model/provider/course_subscribers/course_subscribers_db_response.dart';
import '../../../model/provider/sign_certificate/sign_certificate_db_response.dart';
import '../../../model/user/show_providers/show_providers_db_response.dart';
import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class CoursesRepository {
  SharedPrefService prefService = SharedPrefService();

  getCourses(String type, int page) async {
    try {
      return await DioService()
          .get(type == ""
              ? "/providers/courses?page=$page"
              : '/providers/courses?page=$page&status=$type')
          .then((value) => value.fold((l) => showToast(l), (r) {
                prefService.setValue("subscribe_course", json.encode(r));
                CoursesDbResponse courses = CoursesDbResponse.fromJson(r);
                return courses;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCoursesCache(String type) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('subscribe_course')) {
      var response = prefs.getString('subscribe_course');
      CoursesDbResponse courseResponse =
          CoursesDbResponse.fromJson(json.decode(response!));
      return courseResponse;
    }
  }

  deleteCourse(int id) async {
    try {
      return await DioService()
          .delete("/providers/courses/$id/delete")
          .then((value) => value.fold((l) => showToast(l), (r) {
                showToast(r["message"]);
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
// class ProviderCoursesRepository {

  courseDetails(int id) async {
    try {
      return await DioService()
          .get('/providers/courses/$id/show')
          .then((value) => value.fold((l) => showToast(l), (r) {
                CourseDetailsDbResponse courseDetails =
                    CourseDetailsDbResponse.fromJson(r);
                return courseDetails;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  courseSubscribers(int id) async {
    try {
      return await DioService()
          .get('/providers/courses/$id/subscribers')
          .then((value) => value.fold((l) => showToast(l), (r) {
                CourseSubscribersResponse subscribers =
                    CourseSubscribersResponse.fromJson(r);
                return subscribers;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signCertificate(int id) async {
    try {
      return await DioService()
          .get('/providers/courses/$id/singCertificate')
          .then((value) => value.fold((l) => showToast(l), (r) {
                SignCertificateDbResponse certificate =
                    SignCertificateDbResponse.fromJson(r);
                return certificate;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  showProviders(int id) async {
    try {
      return await DioService()
          .get('/clients/providers/$id/show')
          .then((value) => value.fold((l) => showToast(l), (r) {
                ShowProvidersDbResponse showProviders =
                    ShowProvidersDbResponse.fromJson(r);
                return showProviders;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

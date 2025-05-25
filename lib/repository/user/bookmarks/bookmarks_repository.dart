import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/user/bookmarks/add_bookmark_course/add_bookmark_course_db_response.dart';
import '../../../model/user/bookmarks/add_bookmark_course/add_bookmark_lesson_db_response.dart';
import '../../../model/user/bookmarks/bookmark_courses_db_reponse.dart';
import '../../../model/user/bookmarks/bookmarks_lessons_db_response.dart';
import '../../../service/local/share_prefs_service.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class BookmarksRepository {
  SharedPrefService prefService = SharedPrefService();

  addBookmarks({required int id, required String type}) async {
    try {
      return await DioService().post('/clients/bookmarks/addToBookMark', body: {
        'type': type,
        'id': id,
      }).then(
        (value) => value.fold(
          (l) => showToast(l),
          (r) {
            if (type == 'course') {
              AddBookmarkCourseDbResponse coursesBookmarks =
                  AddBookmarkCourseDbResponse.fromJson(r);

              return coursesBookmarks;
            } else {
              AddBookmarkLessonDbResponse lessonsBookmark =
                  AddBookmarkLessonDbResponse.fromJson(r);
              return lessonsBookmark;
            }
          },
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  lessonsBookmarks() async {
    try {
      return await DioService()
          .get('/clients/bookmarks/lessons')
          .then((value) => value.fold((l) => showToast(l), (r) {
                BookmarksLessonsResponse lessonsBookmarks =
                    BookmarksLessonsResponse.fromJson(r);
                prefService.setValue("bookmark_lesson", json.encode(r));
                return lessonsBookmarks;
              }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  lessonsBookmarksCache() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('bookmark_lesson')) {
      var response = prefs.getString('bookmark_lesson');
      BookmarksLessonsResponse lessonsBookmarks =
          BookmarksLessonsResponse.fromJson(json.decode(response!));
      return lessonsBookmarks;
    }
  }

  coursesBookmarks() async {
    try {
      return await DioService().get('/clients/bookmarks/courses').then(
            (value) => value.fold(
              (l) => showToast(l),
              (r) {
                BookmarkCoursesResponse coursesBookmarks =
                    BookmarkCoursesResponse.fromJson(r);
                prefService.setValue("bookmark_course", json.encode(r));
                return coursesBookmarks;
              },
            ),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  coursesBookmarksCache() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('bookmark_course')) {
      var response = prefs.getString('bookmark_course');
      BookmarkCoursesResponse lessonsBookmarks =
          BookmarkCoursesResponse.fromJson(json.decode(response!));
      return lessonsBookmarks;
    }
  }
}

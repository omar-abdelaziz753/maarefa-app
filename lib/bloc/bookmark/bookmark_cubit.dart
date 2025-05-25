import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/model/common/lessons/lesson_model.dart';

import '../../model/user/bookmarks/bookmark_course_db_model.dart';
import '../../repository/user/bookmarks/bookmarks_repository.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarksRepository bookmarksRepository = BookmarksRepository();

  BookmarkCubit() : super(BookmarkInitial());

  static BookmarkCubit get(BuildContext context) => BlocProvider.of(context);

  List<BookmarkCoursesModel>? bookmarkCourse;
  List<LessonDetails>? bookmarkLesson;

  initBookMarkLesson(data) {
    bookmarkLesson = data;
    emit(InitBookmarkState());
  }

  bookmark(lesson) {
    bookmarkLesson!.remove(lesson);
    emit(RemoveBookmarkState());
  }

  initBookMarkCourse(data) {
    bookmarkCourse = data;
    emit(InitBookmarkState());
  }

  bookmarkCourses(course) {
    bookmarkCourse!.remove(course);
    emit(RemoveBookmarkState());
  }

  getBookmarkCourses() {
    bookmarksRepository.coursesBookmarks().then((value) {
      bookmarkCourse = value.data;
      return emit(BookmarkCoursesLoadedState(data: value.data));
    });
  }

  getBookmarkCoursesCache() {
    bookmarksRepository.coursesBookmarksCache().then((value) {
      bookmarkCourse = value.data;
      return emit(BookmarkCoursesLoadedState(data: value.data));
    });
  }

  getBookmarkLessons() {
    bookmarksRepository.lessonsBookmarks().then((value) {
      bookmarkLesson = value.data;
      return emit(BookmarkLessonsLoadedState(data: value.data));
    });
  }

  getBookmarkLessonsCache() {
    bookmarksRepository.lessonsBookmarksCache().then((value) {
      bookmarkLesson = value.data;
      return emit(BookmarkLessonsLoadedState(data: value.data));
    });
  }

  addToBookMark({
    required int id,
    required String type,
  }) {
    bookmarksRepository.addBookmarks(id: id, type: type).then((value) {
      if (type == 'course') {
        bookmarkCourse = value.data;
        emit(BookmarkCoursesLoadedState(data: value.data));
      } else {
        bookmarkLesson = value.data;
        emit(BookmarkLessonsLoadedState(data: value.data));
      }
    });
  }
}

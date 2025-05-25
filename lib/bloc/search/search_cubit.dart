import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/repository/common/search/search_repository.dart';

import '../../model/common/search/search_db_response.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);
  SearchRepository searchRepository = SearchRepository();
  TextEditingController search = TextEditingController();
  List<SearchCourse>? coursesModel;
  List<SearchLesson>? lessonsModel;
  List<bool> lessonList = [];
  List<bool> courseList = [];

  initCourses(data) {
    coursesModel = data;
    emit(InitCoursesState());
  }

  initLessons(data) {
    lessonsModel = data;
    emit(InitLessonsState());
  }

  initBookMarkLesson(data) {
    lessonsModel = data;
    for (int i = 0; i < data.length; i++) {
      lessonList.add(data[i].isBookmarked);
    }
    emit(InitBookmarkState());
  }

  bookmarkLesson(index) {
    switch (lessonList[index] == true) {
      case true:
        lessonList[index] = false;
        emit(RemoveBookmarkState());
        break;
      case false:
        lessonList[index] = true;
        emit(AddBookmarkState());
        break;
    }
    emit(BookmarkState());
  }

  initBookMarkCourse(data) {
    coursesModel = data;
    for (int i = 0; i < data.length; i++) {
      courseList.add(data[i].isBookmarked);
    }
    emit(InitBookmarkState());
  }

  bookmarkCourse(index) {
    switch (courseList[index] == true) {
      case true:
        courseList[index] = false;
        emit(RemoveBookmarkState());
        break;
      case false:
        courseList[index] = true;
        emit(AddBookmarkState());
        break;
    }
    emit(BookmarkState());
  }

  getSearchedItems(value) {
    searchRepository.getSearchedItems(value).then((value) {
      coursesModel = value.data.courses;
      lessonsModel = value.data.lessons;
      emit(SearchLoaded(
          courses: value.data.courses, lessons: value.data.lessons));
    });
  }
}

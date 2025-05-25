import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/common/lessons/lesson_model.dart';
import '../../repository/user/lessons/lessons_repository.dart';

part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(LessonsInitial());
  LessonsRepository lessonsRepository = LessonsRepository();

  List<LessonDetails> lessonsModel = [];
  List<bool> bookmarkList = [];

  static LessonsCubit get(BuildContext context) => BlocProvider.of(context);
  int page = 1;
  int? selected;
  int? subjectId;

  String? sort;

  setSort(value, yearId, stageId, filter) {
    switch (sort == value) {
      case true:
        sort = value;
        getLessons(yearId: yearId, stageId: stageId, filter: filter);
        emit(SameSortState());
        break;
      case false:
        sort = value;
        getLessons(yearId: yearId, stageId: stageId, filter: filter);
        emit(DifferentSortState());
    }
    emit(ChangeSortState());
  }

  initBookMark(data) {
    // lessonsModel = data;
    for (int i = 0; i < data.length; i++) {
      bookmarkList.add(data[i].isBookmarked);
    }
    emit(InitBookmarkState());
  }

  bookmark(index) {
    switch (bookmarkList[index] == true) {
      case true:
        bookmarkList[index] = false;
        emit(RemoveBookmarkState());
        break;
      case false:
        bookmarkList[index] = true;
        emit(AddBookmarkState());
        break;
    }
    emit(BookmarkState());
  }

  changeSelectedSubjectCard(int index, data, yearId, stageId) {
    if (selected == index) {
      selected = null;
      subjectId = null;

      page = 1;
      // getLessons(yearId: yearId, stageId: stageId);
      emit(SameSelectedSubjectCardState());
    } else {
      selected = index;
      subjectId = data.id;
      page = 1;
      // getLessons(yearId: yearId, stageId: stageId);
      emit(DifferrentSelectedSubjectCardState());
    }
    emit(ChangeSelectedSubjectCardState());
  }

  initLesson(List<LessonDetails> data) {
    page == 1 ? lessonsModel.addAll(data) : lessonsModel.addAll(data);
    initBookMark(lessonsModel);
    emit(InitialLessonState());
  }

  bool ifMore = true;
  getLessons({
    required int yearId,
    required int stageId,
    Map<String, dynamic>? filter,
  }) async {
    if (ifMore || page == 1) {
      if (state is LessonsLoadingState) return;

      final currentState = state;

      var oldLessons = <LessonDetails>[];
      if (currentState is LessonsLoadedState) {
        oldLessons = currentState.lessons;
        lessonsModel = currentState.lessons;
      }
      if (page == 1) {
        oldLessons = [];
        lessonsModel = [];
      }
      emit(LessonsLoadingState(oldLessons, isFirstFetch: page == 1));

      lessonsRepository
          .getLessons(
              yearId: yearId,
              stageId: stageId,
              subjectId: subjectId,
              page: page,
              filter: filter,
              sort: sort)
          .then((newLessons) {
        if (newLessons.data.pagination.hasMorePages == true) {
          page++;
        } else {
          ifMore = false;
        }
        initLesson(newLessons.data.lessons);
        emit(LessonsLoadedState(lessonsModel));
      });
    }
  }

  getLessonById(int id) {
    lessonsRepository.showLessons(id).then((value) {
      emit(LessonDetailsLoadedState(data: value.data));
    });
  }

  getLessonsBySubjectId({
    required int yearId,
    required int stageId,
    required int subjectId,
  }) async {
    lessonsRepository
        .getLessonsBySubjectId(
            yearId: yearId, stageId: stageId, subjectId: subjectId)
        .then((newLessons) {
      emit(LessonsByIdLoadedState(newLessons.data.lessons));
    });
  }
}

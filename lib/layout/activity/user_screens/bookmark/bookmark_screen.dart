import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/layout/view/bookmarks/bookmarks_course_view.dart';
import 'package:my_academy/layout/view/bookmarks/bookmarks_lesson_view.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../../bloc/course_subject/course_subject_cubit.dart';
import '../../../../repository/user/courses/courses_repository.dart';
import '../../../../widget/headers/course_subject/course_subject_header.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CourseSubjectCubit(CoursesRepository()),
      child: BlocConsumer<CourseSubjectCubit, CourseSubjectState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = CourseSubjectCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CourseSubjectHeader(
                    courseTap: () => bloc.chooseCourseSubject(false),
                    subjectTap: () => bloc.chooseCourseSubject(true),
                    isSubject: bloc.isSubject,
                  ),
                  const Space(
                    boxHeight: 20,
                  ),
                  bloc.isSubject
                      ? const BookmarksLessonView()
                      : const BookmarksCourseView(),
                  // BlocProvider(
                  //   create: (BuildContext context) =>
                  //       BookmarkCubit()
                  //         ..getBookmarkCourses(),
                  //   child: BlocConsumer<BookmarkCubit, BookmarkState>(
                  //     listener: (context, state) {},
                  //     builder: (context, state) {
                  //       if (state is BookmarkCoursesLoadedState) {
                  //         // final bloc = BookmarkCubit.get(context);
                  //         return bookMarkCoursesView(data: (state).data);
                  //       } else if (state is BookmarkCoursesErrorState) {
                  //         return const ErrorPage();
                  //       } else {
                  //         return const Loading();
                  //       }
                  //     },
                  //   ),
                  // ) :
                  // BlocProvider(
                  //   create: (BuildContext context) =>
                  //   BookmarkCubit()
                  //     ..getBookmarkLessons(),
                  //   child: BlocConsumer<BookmarkCubit, BookmarkState>(
                  //     listener: (context, state) {},
                  //     builder: (context, state) {
                  //       if (state is BookmarkLessonsLoadedState) {
                  //         // final bloc = BookmarkCubit.get(context);
                  //         return bookMarkLessonsView(data: (state).data);
                  //       } else if (state is BookmarkLessonsErrorState) {
                  //         return const ErrorPage();
                  //       } else {
                  //         return const Loading();
                  //       }
                  //     },
                  //   ),
                  // ),
                  const Space(
                    boxHeight: 70,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

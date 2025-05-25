import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_academy/model/common/search/search_db_response.dart';

import '../../bloc/bookmark/bookmark_cubit.dart';
import '../../bloc/search/search_cubit.dart';
import '../../layout/activity/user_screens/course/course_registration.dart';
import '../../layout/card_view/course/course_card.dart';
import '../../layout/card_view/subject/subject_card.dart';
import '../../res/value/dimenssion/dimenssions.dart';
import '../master_list/custom_list.dart';
import '../space/space.dart';

class SearchResult extends StatelessWidget {
  final SearchData? data;
  const SearchResult({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit()
        ..initCourses(data!.courses)
        ..initLessons(data!.lessons)
        ..initBookMarkCourse(data!.courses)
        ..initBookMarkLesson(data!.lessons),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = SearchCubit.get(context);
          return SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: ListView(
              children: [
                CustomList(
                  listHeight: 100000000000000,
                  listWidth: screenWidth,
                  scroll: const NeverScrollableScrollPhysics(),
                  axis: Axis.vertical,
                  count: bloc.lessonsModel == null
                      ? data!.lessons!.length
                      : bloc.lessonsModel!.length,
                  child: (context, index) => Column(
                    children: [
                      SubjectCard(
                        onTap: () {
                          bloc.bookmarkLesson(index);
                          BlocProvider.of<BookmarkCubit>(context).addToBookMark(
                              id: data!.lessons![index].id!, type: 'lesson');
                        },
                        isUser: true,
                        isBlue: bloc.lessonList[index],
                        lessonDetails: bloc.lessonsModel == null
                            ? data!.lessons![index]
                            : bloc.lessonsModel![index],
                        yearId: null,
                        stageId: null,
                      ),
                      const Space(
                        boxHeight: 15,
                      ),
                    ],
                  ),
                ),
                CustomList(
                    listHeight: 100000000000000,
                    listWidth: screenWidth,
                    scroll: const NeverScrollableScrollPhysics(),
                    axis: Axis.vertical,
                    count: bloc.coursesModel!.length,
                    child: (context, index) => Column(
                          children: [
                            CourseCard(
                              favoriteTap: () {
                                bloc.bookmarkCourse(index);
                                BlocProvider.of<BookmarkCubit>(context)
                                    .addToBookMark(
                                        id: bloc.coursesModel![index].id!,
                                        type: 'course');
                              },
                              isBlue: bloc.courseList[index],
                              id: bloc.coursesModel![index].id,
                              onPress: () => Get.to(
                                CourseRegistration(
                                    isUser: true,
                                    id: bloc.coursesModel![index].id!),
                              ),
                              bookmarkCoursesModel: bloc.coursesModel![index],
                            ),
                            const Space(
                              boxHeight: 15,
                            ),
                          ],
                        )),
                const Space(
                  boxHeight: 300,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

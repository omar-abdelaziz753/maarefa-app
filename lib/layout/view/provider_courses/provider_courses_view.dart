import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/layout/card_view/provider_course/provider_course_card.dart';
import 'package:my_academy/repository/provider/lessons/lessons_repository.dart';

import '../../../bloc/content/content_cubit.dart';
import '../../../model/common/courses/course_model.dart';
import '../../../widget/loader/loader.dart';

class ProviderCourseView extends StatelessWidget {
  ProviderCourseView({super.key});
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ContentCubit>(context).getCourses();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<ContentCubit>(context).getCourses();
    return BlocProvider(
      create: (context) =>
          ContentCubit(ProviderLessonsRepository())..getCourses(),
      child: BlocConsumer<ContentCubit, ContentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<ContentCubit, ContentState>(
              builder: (context, state) {
            // bloc.getStores();
            // bloc.getUserAddress();
            if (state is CoursesLoadingState && state.isFirstFetch ||
                state is ContentInitial) {
              return const Loading();
            }
            List<CourseModel> data = [];
            // ignore: unused_local_variable
            bool isLoading = false;
            if (state is CoursesLoadingState) {
              data = state.oldCourses;
              isLoading = true;
            } else if (state is CoursesLoadedState) {
              isLoading = false;
              data = state.courses;
            }

            return coursesView(context, data);
          });
        },
      ),
    );
  }

  // coursesView(context, List<CourseModel> data) {
  //   return BlocProvider(
  //       create: (context) =>
  //           ContentCubit(ProviderLessonsRepository())..initCourse(data),
  //       child: BlocConsumer<ContentCubit, ContentState>(
  //           listener: (context, state) {},
  //           builder: (context, state) {
  //             final bloc = ContentCubit.get(context);
  //             final List<CourseModel> courseModel = bloc.courseModel;
  //             return ListView(
  //               children: [
  //                 const Space(
  //                   boxHeight: 35,
  //                 ),
  //                 CustomList(
  //                   listHeight: 1000000000000000,
  //                   listWidth: screenWidth,
  //                   scroll: const NeverScrollableScrollPhysics(),
  //                   axis: Axis.vertical,
  //                   count:
  //                       courseModel.isEmpty ? data.length : courseModel.length,
  //                   child: (context, index) => Padding(
  //                     padding: EdgeInsets.only(bottom: 15.h),
  //                     child: ProviderCourseCard(
  //                       data: courseModel.isEmpty
  //                           ? data[index]
  //                           : courseModel[index],
  //                     ),
  //                   ),
  //                 ),
  //                 const Space(
  //                   boxHeight: 75,
  //                 ),
  //               ],
  //             );
  //           }));

  // }

  Widget coursesView(BuildContext context, List<CourseModel> data) {
    return BlocProvider(
      create: (context) =>
          ContentCubit(ProviderLessonsRepository())..initCourse(data),
      child: BlocConsumer<ContentCubit, ContentState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = ContentCubit.get(context);
          final List<CourseModel> courseModel = bloc.courseModel;
          final displayList = courseModel.isEmpty ? data : courseModel;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 16.w, // Horizontal space between items
                mainAxisSpacing: 16.h, // Vertical space between items
                // childAspectRatio: 180.sp, // Width/height ratio of each item
                mainAxisExtent: 200.sp,
              ),
              itemCount: displayList.length,
              itemBuilder: (context, index) => ProviderCourseCard(
                data: displayList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

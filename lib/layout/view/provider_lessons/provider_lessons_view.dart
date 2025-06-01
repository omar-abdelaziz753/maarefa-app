import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/widget/master_list/custom_list.dart';

import '../../../bloc/content/content_cubit.dart';
import '../../../model/common/lessons/lesson_model.dart';
import '../../../repository/provider/lessons/lessons_repository.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../widget/loader/loader.dart';
import '../../card_view/provider_subject/provider_subject_card.dart';

class ProviderLessonView extends StatelessWidget {
  const ProviderLessonView({super.key});
  // final scrollController = ScrollController();

  // void setupScrollController(context) {
  //   scrollController.addListener(() {
  //     if (scrollController.position.atEdge) {
  //       if (scrollController.position.pixels != 0) {
  //         BlocProvider.of<ContentCubit>(context).getLessons();
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // setupScrollController(context);
    return BlocProvider(
      create: (context) =>
          ContentCubit(ProviderLessonsRepository())..getLessons(),
      child: BlocConsumer<ContentCubit, ContentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<ContentCubit, ContentState>(
              builder: (context, state) {
            // bloc.getStores();
            // bloc.getUserAddress();
            if (state is LessonsLoadingState && state.isFirstFetch ||
                state is ContentInitial) {
              return const Loading();
            }
            List<LessonDetails> data = [];
            // ignore: unused_local_variable
            bool isLoading = false;
            if (state is LessonsLoadingState) {
              data = state.oldLessons;
              isLoading = true;
            } else if (state is LessonsLoadedState) {
              isLoading = false;
              data = state.lessons;
            }

            return lessonsView(context, data);
          });
        },
      ),
    );
  }

  lessonsView(context, List<LessonDetails> data) {
    return BlocProvider(
        create: (context) =>
            ContentCubit(ProviderLessonsRepository())..initLesson(data),
        child: BlocConsumer<ContentCubit, ContentState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = ContentCubit.get(context);
              return CustomList(
                listHeight: 1000000000000000,
                listWidth: screenWidth,
                scroll: const NeverScrollableScrollPhysics(),
                axis: Axis.vertical,
                count: bloc.lessonModel.length,
                child: (context, index) => Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                  child: ProviderSubjectCard(
                    data: bloc.lessonModel[index],
                  ),
                ),
              );
            }));
  }
}

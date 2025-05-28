import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../bloc/bookmark/bookmark_cubit.dart';
import '../../../bloc/lessons/lessons_cubit.dart';
import '../../../model/common/subjects/subjects_model.dart';
import '../../../res/drawable/icon/icons.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/buttons/master/master_button.dart';
import '../../../widget/filter_sheet/sort_sheet.dart';
import '../../../widget/loader/loader.dart';
import '../../../widget/master_list/custom_list.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';
import '../../activity/user_screens/filter/course_filter_screen.dart';
import '../../card_view/course_type/course_type_card.dart';
import '../../card_view/subject/subject_card.dart';

class ClassScreenView extends StatefulWidget {
  final List<SubjectModel> subject;
  final int yearId;
  final int stageId;
  final String name;
  final Map<String, dynamic>? filterData;

  const ClassScreenView(
      {super.key,
      required this.subject,
      required this.yearId,
      required this.stageId,
      required this.name,
      required this.filterData});

  @override
  State<ClassScreenView> createState() => _ClassScreenViewState();
}

class _ClassScreenViewState extends State<ClassScreenView> {
  final scrollController = ScrollController();

  void setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        BlocProvider.of<LessonsCubit>(context)
            .getLessons(yearId: widget.yearId, stageId: widget.stageId);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setupScrollController();
  }

  @override
  Widget build(BuildContext context) {
    // setupScrollController(context);
    // BlocProvider.of<LessonsCubit>(context)
    //     .getLessons(yearId: yearId, stageId: stageId);

    return BlocProvider<LessonsCubit>(
      create: (c) => LessonsCubit()
        ..getLessons(
            yearId: widget.yearId,
            stageId: widget.stageId,
            filter: widget.filterData),
      child: BlocBuilder<LessonsCubit, LessonsState>(
        builder: (context, state) {
          if (state is LessonsLoadingState) {
            return const Loading();
          } else if (state is LessonsLoadedState) {
            final data = state.lessons;
            final bloc = context.watch<LessonsCubit>();
            return classView(context, data, bloc);
          } else {
            return const Loading();
          }
        },
      ),
    );
  }

  classView(context, data, LessonsCubit bloc) {
    return Stack(
      alignment: FractionalOffset.bottomCenter,
      children: [
        Column(
          children: [
            const Space(
              boxHeight: 15,
            ),

            SidePadding(
              sidePadding: 15,
              child: CustomList(
                listHeight: 40,
                listWidth: screenWidth,
                scroll: const ScrollPhysics(),
                axis: Axis.horizontal,
                count: widget.subject.length,
                child: (context, index) => GestureDetector(
                  onTap: () {
                    bloc.changeSelectedSubjectCard(index, widget.subject[index],
                        widget.yearId, widget.stageId);
                    bloc.getLessons(
                        yearId: widget.yearId,
                        stageId: widget.stageId,
                        filter: widget.filterData
                        // subjectId: data[index].id!,
                        );
                  },
                  child: CourseTypeCard(
                    title: widget.subject[index].name!,
                    isSelected: bloc.selected == index ? true : false,
                  ),
                ),
              ),
            ),
            // ;
            //     },
            //   ),
            // ),
            const Space(
              boxHeight: 25,
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: bloc.lessonsModel.length,
                itemBuilder: (context, index) => SubjectCard(
                  isUser: true,
                  onTap: () {
                    bloc.bookmark(index);
                    BlocProvider.of<BookmarkCubit>(context).addToBookMark(
                        id: bloc.lessonsModel[index].id!, type: 'lesson');
                  },
                  isBlue: bloc.bookmarkList[index],
                  lessonDetails: bloc.lessonsModel[index],
                  yearId: widget.yearId,
                  stageId: widget.stageId,
                ),
              ),
            ),
            const Space(
              boxHeight: 80,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                MasterButton(
                  onPressed: () {
                    Get.to(() => CourseFilterScreen(
                          type: 'lesson',
                          title: widget.name,
                          yearId: widget.yearId,
                          id: widget.stageId,
                          filter: widget.filterData,
                        ));
                  },
                  buttonText: tr("filter"),
                  sidePadding: 0,
                  buttonHeight: 55,
                  buttonWidth: screenWidth / 2,
                  buttonColor: white,
                  buttonRadius: 0,
                  borderColor: mainColor,
                  buttonStyle: TextStyles.subTitleStyle
                      .copyWith(color: mainColor, fontWeight: FontWeight.w700),
                  icon: filter,
                  iconColor: mainColor,
                  iconSize: 20,
                ),
                const Space(boxWidth: 15),
                MasterButton(
                  onPressed: () => showSortAction(
                      context: context,
                      sort: bloc.sort,
                      closeTap: () {
                        bloc.setSort(null, widget.yearId, widget.stageId,
                            widget.filterData);
                        bloc.getLessons(
                            yearId: widget.yearId,
                            stageId: widget.stageId,
                            filter: widget.filterData);
                        Get.back();
                      },
                      minPrice: () {
                        bloc.setSort("minPrice", widget.yearId, widget.stageId,
                            widget.filterData);
                        bloc.getLessons(
                            yearId: widget.yearId,
                            stageId: widget.stageId,
                            filter: widget.filterData);
                        Get.back();
                      },
                      maxPrice: () {
                        bloc.setSort("maxPrice", widget.yearId, widget.stageId,
                            widget.filterData);
                        bloc.getLessons(
                            yearId: widget.yearId,
                            stageId: widget.stageId,
                            filter: widget.filterData);
                        Get.back();
                      },
                      orderedTap: () {
                        bloc.setSort("mostOrdered", widget.yearId,
                            widget.stageId, widget.filterData);
                        bloc.getLessons(
                            yearId: widget.yearId,
                            stageId: widget.stageId,
                            filter: widget.filterData);
                        Get.back();
                      },
                      rateTap: () {
                        bloc.setSort("rate", widget.yearId, widget.stageId,
                            widget.filterData);
                        bloc.getLessons(
                            yearId: widget.yearId,
                            stageId: widget.stageId,
                            filter: widget.filterData);
                        Get.back();
                      }),
                  buttonText: tr("sort_by"),
                  sidePadding: 0,
                  buttonHeight: 55,
                  buttonWidth: screenWidth / 2,
                  buttonColor: white,
                  buttonRadius: 0,
                  borderColor: mainColor,
                  buttonStyle: TextStyles.subTitleStyle
                      .copyWith(color: mainColor, fontWeight: FontWeight.w700),
                  icon: sortBy,
                  iconColor: mainColor,
                  iconSize: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

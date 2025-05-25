import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/educational_stages_years/educational_stages_cubit.dart';
import '../../../model/common/educational_stages/educational_stages_model.dart';
import '../../../repository/common/educational_stages/educational_stages_repository.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/error/page/error_page.dart';
import '../../../widget/loader/loader.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';
import '../../card_view/class/class_card.dart';
import '../../card_view/grade/grade_card.dart';

class YearsView extends StatelessWidget {
  final List<EducationalStageModel> stages;

  const YearsView({super.key, required this.stages});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          EducationalStagesCubit(EducationalStagesRepository())
            ..getEducationalYears(),
      child: BlocConsumer<EducationalStagesCubit, EducationalStagesState>(
        listener: (context, state) {},
        builder: (context, state) {
          // final bloc = EducationalStagesCubit.get(context);
          if (state is EducationalYearsLoadedState) {
            final data = (state).data;
            return yearsView(context, data);
          } else if (state is EducationalYearsErrorState) {
            return const ErrorPage();
          } else {
            return const Loading();
          }
        },
      ),
    );
  }

  yearsView(context, data) {
    return BlocProvider(
      create: (BuildContext context) =>
          EducationalStagesCubit(EducationalStagesRepository()),
      child: BlocConsumer<EducationalStagesCubit, EducationalStagesState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = EducationalStagesCubit.get(context);
            return SidePadding(
              sidePadding: 35,
              child: ListView(
                children: [
                  LimitedBox(
                    maxHeight: 10000000000000000,
                    maxWidth: screenWidth,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: stages.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return GradeCard(
                          title: stages[index].name!,
                          id: stages[index].id!,
                          onTap: () => bloc.selectStage(index, stages),
                          isSelected: bloc.isSelect == index ? true : false,
                        );
                      },
                    ),
                  ),
                  const Space(
                    boxHeight: 25,
                  ),
                  const Divider(),
                  const Space(
                    boxHeight: 25,
                  ),
                  Visibility(
                    visible: bloc.yearsModel.isEmpty ? false : true,
                    child: Column(
                      children: [
                        Text(tr("grade"),
                            textAlign: TextAlign.start,
                            style: TextStyles.agreeStyle
                                .copyWith(color: blackColor)),
                        const Space(
                          boxHeight: 25,
                        ),
                        LimitedBox(
                          maxHeight: 10000000000000000,
                          maxWidth: screenWidth,
                          child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: bloc.yearsModel.isEmpty
                                  ? data.length
                                  : bloc.yearsModel.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio:
                                          ((screenWidth - 80.w) / 2) / 75.h,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return ClassCard(
                                  stageId: stages[index].id!,
                                  name: bloc.yearsModel.isEmpty
                                      ? data[index].name!
                                      : bloc.yearsModel[index].name!,
                                  id: bloc.yearsModel.isEmpty
                                      ? data[index].id!
                                      : bloc.yearsModel[index].id!,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const Space(
                    boxHeight: 40,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

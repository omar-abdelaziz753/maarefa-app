import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

import '../../../../bloc/educational_stages_years/educational_stages_cubit.dart';
import '../../../../model/common/educational_stages/educational_stages_model.dart';
import '../../../../model/provider/provider/provider_model.dart';
import '../../../../repository/common/educational_stages/educational_stages_repository.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/space/space.dart';

class GradesProfileView extends StatelessWidget {
  final Provider data;
  const GradesProfileView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            EducationalStagesCubit(EducationalStagesRepository())
              ..getEducationalStages(),
        child: BlocConsumer<EducationalStagesCubit, EducationalStagesState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is EducationalStagesLoadedState) {
                final grade = (state).data;
                return gradeView(context, grade);
              } else if (state is EducationalStagesErrorState) {
                return const ErrorPage();
              } else {
                return const Loading();
              }
            }));
  }

  gradeView(BuildContext context, List<EducationalStageModel>? grade) {
    return BlocProvider(
        create: (BuildContext context) =>
            EducationalStagesCubit(EducationalStagesRepository())
              ..getInitGrade(grade)
              ..initProviderGrade(data, grade!),
        child: BlocConsumer<EducationalStagesCubit, EducationalStagesState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = EducationalStagesCubit.get(context);
              return ListView(
                children: [
                  SidePadding(
                    sidePadding: 35,
                    child: Column(
                      children: [
                        Wrap(
                          children: List.generate(
                              grade!.length,
                              (index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.h, horizontal: 3.w),
                                  child: ChoiceChip(
                                      backgroundColor: white,
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: textfieldColor),
                                          borderRadius:
                                              BorderRadius.circular(25.r)),
                                      onSelected: (t) =>
                                          bloc.chooseGrades(t, index, grade),
                                      selectedColor: mainColor,
                                      label: Text(grade[index].name.toString(),
                                          style: bloc.selectedGrade[index]
                                              ? TextStyles.unselectedStyle
                                                  .copyWith(color: white)
                                              : TextStyles.unselectedStyle),
                                      selected: bloc.selectedGrade[index]))),
                        ),
                        Space(
                          boxHeight: screenHeight / 3,
                        ),
                        MasterLoadButton(
                            buttonController: bloc.gradesController,
                            onPressed: () => bloc.editGrades(),
                            sidePadding: 0,
                            buttonText: tr("updating_data")),
                        const Space(
                          boxHeight: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}

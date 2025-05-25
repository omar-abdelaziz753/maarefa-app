import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

import '../../../../bloc/auth/provider/auth_provider_cubit.dart';
import '../../../../bloc/educational_stages_years/educational_stages_cubit.dart';
import '../../../../model/common/educational_stages/educational_stages_model.dart';
import '../../../../repository/common/educational_stages/educational_stages_repository.dart';
import '../../../../repository/provider/auth_provider/auth_provider_repository.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/buttons/master/master_button.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/space/space.dart';

class GradesRegisterView extends StatelessWidget {
  final Map<String, dynamic> data;
  const GradesRegisterView({super.key, required this.data});

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
            AuthProviderCubit(AuthProviderRepository())..getInitGrade(grade),
        child: BlocConsumer<AuthProviderCubit, AuthProviderState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = AuthProviderCubit.get(context);
              return SidePadding(
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
                    MasterButton(
                        onPressed: () => bloc.validateGrades(data),
                        sidePadding: 0,
                        buttonText: tr("next")),
                    const Space(
                      boxHeight: 100,
                    ),
                  ],
                ),
              );
            }));
  }
}

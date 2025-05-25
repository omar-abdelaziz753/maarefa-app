import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

import '../../../../bloc/specialzation/specialization_cubit.dart';
import '../../../../bloc/specialzation/specialization_state.dart';
import '../../../../model/common/courses/course_details/course_details_model.dart';
import '../../../../model/provider/provider/provider_model.dart';
import '../../../../repository/common/specializations/specializations_repository.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/space/space.dart';

class SpecializationProfileView extends StatelessWidget {
  final Provider data;
  const SpecializationProfileView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            SpecializationCubit(SpecializationsRepository())
              ..getSpecializations(),
        child: BlocConsumer<SpecializationCubit, SpecializationState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SpecializationLoadedState) {
                final specialization = (state).data;
                return specializationView(context, specialization);
              } else if (state is SpecializationErrorState) {
                return const ErrorPage();
              } else {
                return const Loading();
              }
            }));
  }

  specializationView(
      BuildContext context, List<Specialization>? specialization) {
    return BlocProvider(
        create: (BuildContext context) =>
            SpecializationCubit(SpecializationsRepository())
              ..getInitSpecialization(specialization)
              ..initProviderSpecialization(data, specialization!),
        child: BlocConsumer<SpecializationCubit, SpecializationState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = SpecializationCubit.get(context);
              return ListView(
                children: [
                  SidePadding(
                    sidePadding: 35,
                    child: Column(
                      children: [
                        Wrap(
                          children: List.generate(
                              specialization!.length,
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
                                          bloc.chooseSpecialization(
                                              t, index, specialization),
                                      selectedColor: mainColor,
                                      label: Text(
                                          specialization[index].name.toString(),
                                          style:
                                              bloc.selectedSpecialization[index]
                                                  ? TextStyles.unselectedStyle
                                                      .copyWith(color: white)
                                                  : TextStyles.unselectedStyle),
                                      selected:
                                          bloc.selectedSpecialization[index]))),
                        ),
                        Space(
                          boxHeight: screenHeight / 3,
                        ),
                        MasterLoadButton(
                            buttonController: bloc.specializationController,
                            onPressed: () => bloc.editSpecialization(),
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

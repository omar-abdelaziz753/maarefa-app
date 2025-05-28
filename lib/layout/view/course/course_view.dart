import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/specialzation/specialization_cubit.dart';
import '../../../bloc/specialzation/specialization_state.dart';
import '../../../model/common/courses/course_details/course_details_model.dart';
import '../../../repository/common/specializations/specializations_repository.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../widget/error/page/error_page.dart';
import '../../../widget/loader/loader.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../card_view/specification/specification_card.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SpecializationCubit(SpecializationsRepository())
            ..getSpecializations(),
      child: BlocConsumer<SpecializationCubit, SpecializationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<SpecializationCubit, SpecializationState>(
              builder: (context, state) {
            if (state is SpecializationLoadedState) {
              final data = (state).data;
              return courseView(context, data);
            } else if (state is SpecializationErrorState) {
              return const ErrorPage();
            } else {
              return const Loading();
            }
          });
        },
      ),
    );
  }

  courseView(context, List<Specialization>? data) {
    return SidePadding(
      sidePadding: 15,
      child: ListView(
        children: [
          LimitedBox(
            maxHeight: 10000000000000000,
            maxWidth: screenWidth,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data!.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: ((screenWidth - 80.w) / 2) / 90.h,
                  crossAxisCount: 2),
              itemBuilder: (context, index) =>
                  SpecificationCard(specializationsModel: data[index]),
            ),
          ),
        ],
      ),
    );
  }
}

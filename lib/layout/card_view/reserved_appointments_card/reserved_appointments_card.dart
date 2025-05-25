import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/add_request/add_request_cubit.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/space/space.dart';

class ReservedAppointmentsCard extends StatelessWidget {
  final dynamic lessonDetails;
  final List<int>? times;

  const ReservedAppointmentsCard({
    super.key,
    this.lessonDetails,
    this.times,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            AddRequestCubit()..initTimes(times, lessonDetails!.times),
        child: BlocConsumer<AddRequestCubit, AddRequestState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = AddRequestCubit.get(context);
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: times!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr("reserved_appointments"),
                          style: TextStyles.appBarStyle.copyWith(color: black),
                        ),
                        const Space(
                          boxHeight: 20,
                        ),
                        Container(
                          width: screenWidth,
                          color: profileColor,
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      DateFormat("yyyy-MM-dd").format(
                                          bloc.timeModel[index].startsAt!),
                                      style: TextStyles.contentStyle
                                          .copyWith(color: mainColor),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      DateFormat("HH:mm").format(
                                          bloc.timeModel[index].startsAt!),
                                      style: TextStyles.agreeStyle
                                          .copyWith(color: black),
                                    ),
                                    Text(
                                      DateFormat("HH:mm").format(
                                          bloc.timeModel[index].endsAt!),
                                      style: TextStyles.agreeStyle
                                          .copyWith(color: black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }));
  }
}

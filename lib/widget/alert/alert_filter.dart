import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

import '../../bloc/subscribe/subscribe_cubit.dart';
import '../../repository/user/subscriptions/subscriptions_repository.dart';
import '../../res/drawable/icon/icons.dart';
import '../../res/value/style/textstyles.dart';
import '../buttons/master/master_button.dart';
import '../space/space.dart';

class FilterAlert extends StatelessWidget {
  final String? type;

  const FilterAlert({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SubscribeCubit(SubscriptionsRepository()),
      child: BlocConsumer<SubscribeCubit, SubscribeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<SubscribeCubit, SubscribeState>(
            builder: (context, state) {
              final bloc = SubscribeCubit.get(context);
              return SizedBox(
                height: 350.h,
                child: SidePadding(
                  sidePadding: 35,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            tr("filter"),
                            style: TextStyles.appBarStyle
                                .copyWith(color: black, fontSize: 20),
                          ),
                          const Space(
                            boxWidth: 100,
                          ),
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(circleXmark)),
                        ],
                      ),
                      const Space(
                        boxHeight: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MasterButton(
                              buttonText: tr("comming"),
                              buttonStyle: TextStyles.agreeStyle.copyWith(
                                  color:
                                      bloc.status == 'comming' ? white : grey),
                              borderColor: profileColor,
                              buttonHeight: 115,
                              buttonColor:
                                  bloc.status == 'comming' ? mainColor : white,
                              onPressed: () {
                                bloc.changeFilter('comming');
                              },
                            ),
                          ),
                          const Space(
                            boxWidth: 10,
                          ),
                          Expanded(
                            child: MasterButton(
                              buttonText: tr("finished"),
                              borderColor: profileColor,
                              buttonStyle: TextStyles.agreeStyle.copyWith(
                                  color:
                                      bloc.status == 'finished' ? white : grey),
                              buttonHeight: 115,
                              buttonColor:
                                  bloc.status == 'finished' ? mainColor : white,
                              onPressed: () {
                                bloc.changeFilter('finished');
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MasterButton(
                              onPressed: () {
                                if (type == 'lesson') {
                                  bloc.getFilteredLessonsHandler();
                                } else {
                                  bloc.getFilteredCoursesHandler();
                                }
                                Navigator.pop(context);
                              },
                              borderColor: mainColor,
                              buttonText: tr("filter"),
                            ),
                          ),
                          const Space(
                            boxWidth: 10,
                          ),
                          Expanded(
                            child: MasterButton(
                              buttonColor: profileColor,
                              borderColor: profileColor,
                              onPressed: () {
                                bloc.clearFilter(type);
                              },
                              buttonText: tr("clear_filter"),
                              buttonStyle: TextStyles.appBarStyle
                                  .copyWith(color: mainColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

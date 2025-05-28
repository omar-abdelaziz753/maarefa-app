import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../bloc/subscribe/subscribe_cubit.dart';
import '../../res/drawable/icon/icons.dart';
import '../../res/value/color/color.dart';
import '../../res/value/style/textstyles.dart';
import '../buttons/master/master_button.dart';
import '../side_padding/side_padding.dart';
import '../space/space.dart';

// import '../../../layouts/view/filter/filter_view.dart';
// import '../../../res/values/dimenssion/screenutil.dart';

showFilterAction(BuildContext context, String? type) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: BlocProvider.value(
            value: BlocProvider.of<SubscribeCubit>(context),
            child: BlocConsumer<SubscribeCubit, SubscribeState>(
              listener: (context, state) {},
              builder: (context, state) {
                final bloc = SubscribeCubit.get(context);
                return SizedBox(
                  height: 350.h,
                  child: SidePadding(
                    sidePadding: 15,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Center(
                              child: Text(
                                tr("filter"),
                                style: TextStyles.appBarStyle
                                    .copyWith(color: black, fontSize: 20),
                              ),
                            ),
                            // const Space(
                            //   boxWidth: 150,
                            // ),
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
                                    color: bloc.status == 'comming'
                                        ? white
                                        : grey),
                                borderColor: profileColor,
                                buttonHeight: 100,
                                buttonColor: bloc.status == 'comming'
                                    ? mainColor
                                    : white,
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
                                    color: bloc.status == 'finished'
                                        ? white
                                        : grey),
                                buttonHeight: 100,
                                buttonColor: bloc.status == 'finished'
                                    ? mainColor
                                    : white,
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
                                  Get.back();
                                },
                                buttonText: tr("filter"),
                                // buttonStyle: TextStyles.appBarStyle
                                //     .copyWith(color: mainColor),
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
            ),
          ),
        );
      });
}

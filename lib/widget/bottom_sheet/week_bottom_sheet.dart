import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../bloc/content/content_cubit.dart';
import '../../res/drawable/icon/icons.dart';
import '../master_list/custom_list.dart';

daysBottomSheet() {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: Get.context!,
      builder: (context) {
        return BlocProvider.value(
            value: BlocProvider.of<ContentCubit>(context),
            // create: (BuildContext context) =>
            // ContentCubit(ProviderLessonsRepository()),
            child: BlocConsumer<ContentCubit, ContentState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final bloc = ContentCubit.get(context);
                  return SidePadding(
                    sidePadding: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                circleXmark,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          tr("sort_by"),
                          style: TextStyles.introStyle.copyWith(color: black),
                        ),
                        CustomList(
                            listHeight: 100000000000000,
                            listWidth: screenWidth,
                            scroll: const NeverScrollableScrollPhysics(),
                            axis: Axis.vertical,
                            count: Get.locale!.languageCode == "ar"
                                ? bloc.daysAr.length
                                : bloc.daysEn.length,
                            child: (context, index) => InkWell(
                                  onTap: () => bloc.selectDays(index),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            Get.locale!.languageCode == "ar"
                                                ? bloc.daysAr[index]
                                                : bloc.daysEn[index],
                                            style: TextStyles.hintStyle
                                                .copyWith(fontSize: 16),
                                          ),
                                          bloc.selectedDays.contains(index)
                                              ? Image.asset(
                                                  trueIcon,
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                )),
                        const Space(boxHeight: 10),
                        MasterButton(
                      //     buttonStyle: TextStyles.appBarStyle
                      // .copyWith(color: mainColor),
                          buttonText: tr("save"),
                          onPressed: () => Get.back(),
                        ),
                        const Space(boxHeight: 30),
                      ],
                    ),
                  );
                }));
      });
}

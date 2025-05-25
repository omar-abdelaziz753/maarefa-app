import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bloc/filter/filter_cubit.dart';
import '../../../../res/drawable/image/images.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/buttons/master/master_button.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';
import '../../../../widget/textfield/master/master_textfield.dart';

class CourseFilterView extends StatelessWidget {
  final String title, type;
  final int id;
  final int? yearId;
  final Map<String, dynamic>? filter;
  const CourseFilterView(
      {super.key,
      required this.title,
      required this.type,
      required this.id,
      this.yearId,
      this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FilterCubit()..getSpecializations(),
        child: BlocConsumer<FilterCubit, FilterState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                if (state is SpecializationLoadedState) {
                  final data = (state).data;
                  return filterView(context, data);
                } else if (state is SpecializationErrorState) {
                  return const ErrorPage();
                } else {
                  return const Loading();
                }
              });
            }));
  }

  filterView(context, data) {
    return BlocProvider(
        create: (BuildContext context) => FilterCubit()
          ..initPrice(filter, data)
          ..initRate(filter)
          ..initSpecialzation(filter)
          ..initStatus(filter),
        child: BlocConsumer<FilterCubit, FilterState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = FilterCubit.get(context);
              return SidePadding(
                sidePadding: 35,
                child: ListView(
                  children: [
                    type != 'course'
                        ? Container()
                        : ExpansionTile(
                            title: Text(
                              tr("the_specialty"),
                              style:
                                  TextStyles.agreeStyle.copyWith(color: black),
                            ),
                            children: [
                              Wrap(
                                children: List.generate(
                                  bloc.specializationList!.length,
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
                                      onSelected: (t) {
                                        bloc.changeSelectedSpecialization(index,
                                            bloc.specializationList![index]);
                                        bloc.getFiltersMap(
                                            'specialization_ids[]',
                                            bloc.specializationList![index]
                                                .id!);
                                      },
                                      selectedColor: mainColor,
                                      label: Text(
                                          bloc.specializationList![index].name!,
                                          style: TextStyles.unselectedStyle
                                              .copyWith(
                                                  color:
                                                      bloc.selectedSpecialization ==
                                                              index
                                                          ? white
                                                          : grey)),
                                      selected:
                                          bloc.selectedSpecialization == index
                                              ? true
                                              : false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Space(
                      boxHeight: 20.h,
                    ),
                    type != 'course'
                        ? Container()
                        : ExpansionTile(
                            title: Text(
                              tr("rate"),
                              style:
                                  TextStyles.agreeStyle.copyWith(color: black),
                            ),
                            children: [
                              Wrap(
                                children: List.generate(
                                  5,
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
                                      onSelected: (t) {
                                        bloc.changeSelectedRate(index);
                                        bloc.getFiltersMap('rate', index);
                                      },
                                      selectedColor: mainColor,
                                      label: SizedBox(
                                        width: 60,
                                        height: 35,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(star),
                                            Text("$index "),
                                          ],
                                        ),
                                      ),
                                      selected: bloc.selectedRate == index
                                          ? true
                                          : false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Space(
                      boxHeight: 20.h,
                    ),
                    type != 'course'
                        ? Container()
                        : ExpansionTile(
                            title: Text(
                              tr("explanation_type"),
                              style:
                                  TextStyles.agreeStyle.copyWith(color: black),
                            ),
                            children: [
                              Wrap(
                                children: List.generate(
                                  bloc.statusList.length,
                                  (index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 3.w),
                                    child: ChoiceChip(
                                      backgroundColor: white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: textfieldColor),
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                      ),
                                      onSelected: (t) {
                                        bloc.changeSelectedStatus(index);
                                        bloc.getFiltersMap('type', index + 1);
                                      },
                                      selectedColor: mainColor,
                                      label: Text(
                                        bloc.statusList[index],
                                        style:
                                            TextStyles.unselectedStyle.copyWith(
                                          color: bloc.status == index
                                              ? white
                                              : grey,
                                        ),
                                      ),
                                      selected:
                                          bloc.status == index ? true : false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Space(
                      boxHeight: 20.h,
                    ),
                    ExpansionTile(
                      title: Text(
                        tr("price"),
                        style: TextStyles.agreeStyle.copyWith(color: black),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tr("from"),
                                    style: TextStyles.agreeStyle,
                                  ),
                                  MasterTextField(
                                    controller: bloc.minPrice,
                                    hintText: "",
                                    fieldHeight: 50,
                                    keyboardType: TextInputType.number,
                                  )
                                ],
                              ),
                            ),
                            Space(
                              boxWidth: 10.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tr("to"),
                                    style: TextStyles.agreeStyle,
                                  ),
                                  MasterTextField(
                                    controller: bloc.maxPrice,
                                    hintText: "",
                                    fieldHeight: 50,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Space(
                        //   boxHeight: 20.h,
                        // ),
                        // const SliderContainer(),
                        Space(
                          boxHeight: 20.h,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MasterButton(
                              onPressed: () {
                                type == "course"
                                    ? bloc.getFilteredCourses(title, id)
                                    : bloc.getFilteredLessons(
                                        title, yearId, id);
                              },
                              buttonColor: mainColor,
                              buttonText: tr("filter")),
                        ),
                        Space(
                          boxWidth: 10.w,
                        ),
                        Expanded(
                          child: MasterButton(
                            buttonColor: profileColor,
                            borderColor: profileColor,
                            onPressed: () {
                              bloc.clearFilter(type == "course" ? true : false,
                                  yearId, id, title);
                            },
                            buttonText: tr("clear_filter"),
                            buttonStyle: TextStyles.appBarStyle
                                .copyWith(color: mainColor),
                          ),
                        ),
                      ],
                    ),
                    Space(
                      boxHeight: 20.h,
                    ),
                  ],
                ),
              );
            }));
  }
}

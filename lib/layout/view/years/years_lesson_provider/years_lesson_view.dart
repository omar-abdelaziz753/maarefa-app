import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/content/content_cubit.dart';
import '../../../../model/common/educational_stages/educational_years_model.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/dropdown/content/content_dropdown.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/space/space.dart';

class YearsLessonView extends StatefulWidget {
  final int id;
  final VoidCallback Function(dynamic)? yearTap;
  final dynamic yearValue;
  const YearsLessonView({
    super.key,
    required this.id,
    this.yearTap,
    this.yearValue,
  });

  @override
  State<YearsLessonView> createState() => _YearsLessonViewState();
}

class _YearsLessonViewState extends State<YearsLessonView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContentCubit, ContentState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bloc = context.watch<ContentCubit>();
        final list = bloc.yearsModel;
        if (list.isNotEmpty) {
          return Column(
            children: [
              ContentDropDown(
                isExpanded: true,
                value: widget.yearValue,
                onChange: widget.yearTap,
                items: bloc.yearsModel
                    .map<DropdownMenuItem<EducationalYearModel>>(
                        (EducationalYearModel value) {
                  return DropdownMenuItem<EducationalYearModel>(
                      value: value,
                      child: Center(
                          child: Text("${value.name}",
                              style: TextStyles.appBarStyle
                                  .copyWith(color: mainColor))));
                }).toList(),
                hint: tr("academic_year"),
                image: "",
              ),
              const Space(
                boxHeight: 15,
              ),
            ],
          );
        } else {
          return const Loading();
        }
      },
    );
  }
}

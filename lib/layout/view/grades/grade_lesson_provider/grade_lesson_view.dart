// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bloc/content/content_cubit.dart';
import '../../../../bloc/educational_stages_years/educational_stages_cubit.dart';
import '../../../../model/common/educational_stages/educational_stages_model.dart';
import '../../../../model/common/lessons/lesson_model.dart';
import '../../../../repository/common/educational_stages/educational_stages_repository.dart';
import '../../../../repository/provider/lessons/lessons_repository.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/alert/delete/delete_alert.dart';
import '../../../../widget/buttons/master/master_button.dart';
import '../../../../widget/buttons/master_load/master_load_button.dart';
import '../../../../widget/custom_grid/custom_grid.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';
import '../../../../widget/textfield/master/master_textfield.dart';
import '../../../card_view/date/date_card.dart';
import '../../specialization/specialization_lesson_provider/specialization_lesson_view.dart';
import '../../years/years_lesson_provider/years_lesson_view.dart';

class GradesLessonView extends StatelessWidget {
  const GradesLessonView({super.key, this.lesson});
  final LessonDetails? lesson;
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
                final data = (state).data;
                return BlocProvider(
                    create: (BuildContext context) =>
                        ContentCubit(ProviderLessonsRepository()),
                    child: GradView(
                      data: data,
                      lesson: lesson,
                    ));
              } else if (state is EducationalStagesErrorState) {
                return const ErrorPage();
              } else {
                return const Loading();
              }
            }));
  }
}

class GradView extends StatefulWidget {
  const GradView({
    super.key,
    this.lesson,
    required this.data,
  });
  final List<EducationalStageModel> data;
  final LessonDetails? lesson;
  @override
  State<GradView> createState() => _GradViewState();
}

class _GradViewState extends State<GradView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero, () async {
      if (widget.lesson != null) {
        final lessonData = widget.lesson!;
        ContentCubit bloc = context.read<ContentCubit>();
        bloc.description.text = lessonData.content ?? "";
        bloc.price.text = lessonData.hourPrice.toString().split('.').first;
        bloc.grade = widget.data.firstWhere(
            (element) => element.id == lessonData.educationalStage?.id);
        bloc.chooseGrade(bloc.grade,
            lessonYear: lessonData.educationalYear!,
            lessonSubject: lessonData.subject);
      }
    });
  }

  // DateTime _selectedDateTime = DateTime.now();
  DateTime _initialDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour,
    DateTime.now().minute,
  );

  void _updateDateTime() {
    setState(() {
      _initialDateTime = DateTime.now().add(const Duration(days: 1));
    });
  }

  TextEditingController lessonDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContentCubit, ContentState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.watch<ContentCubit>();
          return SidePadding(
            sidePadding: 35,
            child: ListView(
              children: [
                Text(
                  tr("subject"),
                  style: TextStyles.contentStyle,
                ),
                Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: textfieldColor,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: DropdownButton<EducationalStageModel>(
                    isExpanded: true,
                    elevation: 0,
                    hint: SidePadding(
                      sidePadding: 15,
                      child: Text(
                        tr("grades"),
                        style:
                            TextStyles.appBarStyle.copyWith(color: mainColor),
                      ),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: profileIconCardColor,
                      size: 40.h,
                    ),
                    dropdownColor: white,
                    style: TextStyles.appBarStyle.copyWith(color: mainColor),
                    borderRadius: BorderRadius.circular(4.r),
                    value: bloc.grade,
                    onChanged: (val) => bloc.chooseGrade(val),
                    items: widget.data
                        .map<DropdownMenuItem<EducationalStageModel>>(
                            (EducationalStageModel value) {
                      return DropdownMenuItem<EducationalStageModel>(
                          value: value,
                          child: Center(
                              child: Text("${value.name}",
                                  style: TextStyles.appBarStyle
                                      .copyWith(color: mainColor))));
                    }).toList(),
                  ),
                ),
                // ContentDropDown(
                //   isExpanded: true,
                //   value: bloc.grade,
                //   onChange: (val) => bloc.chooseGrade(val),
                //   items: widget.data
                //       .map<DropdownMenuItem<EducationalStageModel>>(
                //           (EducationalStageModel value) {
                //     return DropdownMenuItem<EducationalStageModel>(
                //         value: value,
                //         child: Center(
                //             child: Text("${value.name}",
                //                 style: TextStyles.appBarStyle
                //                     .copyWith(color: mainColor))));
                //   }).toList(),
                //   hint: tr("grades"),
                //   image: "",
                // ),
                const Space(
                  boxHeight: 15,
                ),
                if (bloc.gradeId != null)
                  YearsLessonView(
                    id: bloc.gradeId!,
                    yearValue: bloc.year,
                    yearTap: (val) => bloc.chooseYear(val),
                  ),
                if (bloc.yearId != null)
                  SpecializationLessonView(
                    id: bloc.yearId!,
                    isEdit: widget.lesson != null,
                    subjectValue: bloc.subject,
                    subjectTap: (val) => bloc.chooseSubject(val),
                  ),
                MasterTextField(
                  controller: bloc.description,
                  hintText: tr("description"),
                  maxLines: 5,
                  minLines: 5,
                  fieldHeight: 130,
                  errorText: bloc.validators[0],
                  onChanged: (val) => bloc.validate(val, 0),
                ),
                const Space(
                  boxHeight: 20,
                ),
                MasterTextField(
                  controller: bloc.price,
                  hintText: tr("hourly_price"),
                  keyboardType: TextInputType.number,
                  errorText: bloc.validators[1],
                  onChanged: (val) => bloc.validate(val, 1),
                ),
                const Space(
                  boxHeight: 15,
                ),
                MasterTextField(
                  controller: lessonDateController,
                  hintText: tr("lesson_time_date"),
                  keyboardType: TextInputType.number,
                  readOnly: true,
                  // errorText: bloc.validators[1],
                  onTap: () {
                    _updateDateTime();
                    _showDialog(
                        CupertinoDatePicker(
                          key: ValueKey(
                              _initialDateTime), // Unique key for each update
                          initialDateTime: _initialDateTime,
                          use24hFormat: true,

                          mode: CupertinoDatePickerMode.dateAndTime,
                          onDateTimeChanged: (DateTime newDateTime) {
                            setState(() {
                              _initialDateTime = newDateTime;
                              // receiptDateTime = _initialDateTime;
                              String formattedHour = DateFormat('HH', 'en')
                                  .format(_initialDateTime);
                              String formattedMinute = DateFormat('mm', 'en')
                                  .format(_initialDateTime);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd', 'en')
                                      .format(_initialDateTime);
                              lessonDateController.text =
                                  '$formattedDate $formattedHour:$formattedMinute';
                              context.read<ContentCubit>().setDate(
                                  formattedDate,
                                  '$formattedHour:$formattedMinute');
                              // log(' reserveVehicle.receiptDateAndTime.text 0 ${reserveVehicle.receiptDateAndTime.text.split(' ')[0]}');
                              // log(' reserveVehicle.receiptDateAndTime.text  1 ${reserveVehicle.receiptDateAndTime.text.split(' ')[1]}');
                            });
                          },
                        ),
                        context);
                  },
                  // onChanged: (val) => bloc.validate(val, 1),
                ),

                // DateTimePicker(
                //   type: DateTimePickerType.dateTimeSeparate,
                //   dateMask: 'd MMM, yyyy',
                //   use24HourFormat: true,
                //   initialValue: DateTime.now().toString(),
                //   firstDate: DateTime.now(),

                //   lastDate: DateTime(DateTime.now().year + 1),
                //   icon: Image.asset(date, height: 30.h, fit: BoxFit.contain),
                //   locale: const Locale(
                //     'en',
                //   ),
                //   dateLabelText: tr("date"),
                //   timeLabelText: tr("time"),
                //   // selectableDayPredicate: (DateTime s) => bloc.setDate(s),
                //   onChanged: (v) => bloc.setDate(v, null),
                // ),
                const Space(
                  boxHeight: 20,
                ),
                MasterButton(
                  onPressed: () => bloc.addDate(),
                  // CupertinoRoundedDatePicker.show(
                  //   context,
                  //   locale: const Locale('en'),
                  //   textColor: black,
                  //   background: white,
                  //   borderRadius: 16,
                  //   // initialDate: DateTime.now(),
                  //   minimumDate: DateTime.now(),
                  //   maximumDate: DateTime(DateTime.now().year + 1),
                  //   use24hFormat: false,
                  //   initialDatePickerMode:
                  //       CupertinoDatePickerMode.dateAndTime,

                  //   onDateTimeChanged: (DateTime s) => bloc.setDate(s),
                  // ),
                  buttonText: tr("add_table"),
                  buttonColor: profileColor,
                  borderColor: profileColor,
                  buttonStyle:
                      TextStyles.appBarStyle.copyWith(color: mainColor),
                ),
                // bloc.period == null
                //     ? Container()
                //     : Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("${bloc.period!.day} ${bloc.period!.time}"),
                //           TextButton(
                //               onPressed: () => bloc.addDate(),
                //               child: Text(tr("add_date"),
                //                   style: TextStyles.smallStyle
                //                       .copyWith(color: mainColor))),
                //         ],
                //       ),
                const Space(
                  boxHeight: 25,
                ),
                CustomGrid(
                  listHeight: 10000000000000,
                  scroll: const NeverScrollableScrollPhysics(),
                  count: bloc.periodList.length,
                  aspectRatio: 3.h,
                  child: (context, index) => DateCard(
                      onTap: () => deleteAlert(
                          deleteTap: () =>
                              bloc.deleteDate(bloc.periodList[index])),
                      date: bloc.periodList[index]!.day,
                      time: bloc.periodList[index]!.time),
                ),
                const Space(
                  boxHeight: 25,
                ),
                MasterLoadButton(
                  buttonController: bloc.contentController,
                  onPressed: () => bloc.addLesson(),
                  buttonText: tr("add_content"),
                ),
                const Space(
                  boxHeight: 100,
                ),
              ],
            ),
          );
        });
  }

  calenderBottomSheet(BuildContext context) {
    //  final selectedDate = context.read<AddShipmentCubit>().selectedDate;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(20)),
                    child: CupertinoDatePicker(
                      //  initialDateTime: context.watch<AddShipmentCubit>().newDate,
                      minimumDate: DateTime.now(),
                      // maximumYear: DateTime.now().add(Duration(days: 365)),
                      maximumDate:
                          DateTime.now().add(const Duration(days: 3650)),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime newDate) {
                        context.read<ContentCubit>().setDate(null, newDate);
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(style: BorderStyle.none),
                        ),
                        child: Center(
                          child: Text(
                            tr('done'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

void _showDialog(Widget child, BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system
      // navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}

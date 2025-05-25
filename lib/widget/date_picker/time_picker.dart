import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/res/drawable/icon/icons.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';

import '../../bloc/time_picker/time_picker_cubit.dart';

class TimePickerWidget extends StatelessWidget {
  final String labelText;
  const TimePickerWidget({super.key, required this.labelText});
  static const routeName = '/TimeLight';
  @override
  Widget build(BuildContext context) {
    final bloc = TimePickerCubit.get(context);
    return BlocProvider(
        create: (BuildContext context) => TimePickerCubit()..initTimeState(),
        child: BlocConsumer<TimePickerCubit,TimePickerState>(listener: (BuildContext context, state) {  },
          builder: (BuildContext context, Object? state) {
            return Material(
                child: TextField(
                  controller: bloc.pickTimeController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: Image.asset(clockIcon),
                      labelText: labelText,
                      labelStyle: TextStyles.errorStyle.copyWith(color: sufixtextColor)),
                  readOnly: true,
                  onTap: bloc.timePicker,
                ));
          },)
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'time_picker_state.dart';
class TimePickerCubit extends Cubit<TimePickerState> {
  TimePickerCubit() : super(TimePickerInitial());
  static TimePickerCubit get(BuildContext context) => BlocProvider.of(context);
  TimeOfDay? selectedTime;
  TextEditingController pickTimeController = TextEditingController();
  String timeText = '--:--';
  void initTimeState() {
    final DateTime now = DateTime.now();
    selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
    pickTimeController = TextEditingController(text: timeText);
    emit(TimePickerInitial());
  }
  void timePicker()async{
      TimeOfDay? time = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime!,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primaryColor: Colors.blue,
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: Colors.blueAccent),
            ),
            child: child ?? Container(),
          );
        },
      );
      if (time != null) {
        MaterialLocalizations localizations =
        // ignore: use_build_context_synchronously
        MaterialLocalizations.of(Get.context!);
        String formattedTime =
        localizations.formatTimeOfDay(time, alwaysUse24HourFormat: true);
        timeText = formattedTime;
        pickTimeController.text = timeText;
      }
      emit(TimePickerInitialState());
}
}
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';

// part 'date_picker_state.dart';
// class DatePickerCubit extends Cubit<DatePickerState> {
//   DatePickerCubit() : super(DatePickerInitialState());
//   static DatePickerCubit get(BuildContext context) => BlocProvider.of(context);
//   TextEditingController dateInput = TextEditingController();
//   void datePicker()async{
//       DateTime? pickedDate = await showDatePicker(
//         context: Get.context!,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2000),
//         lastDate: DateTime(2101),
//       ) as DateTime;
//       if (pickedDate != null) {
//         String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//         formattedDate;
//           dateInput.text = formattedDate;
//       } else {
//         debugPrint("Date is not selected");
//     }
//       emit(FormatDataInputPickerState());
//   }
//   void initDateState() {
//     dateInput.text = "";
//     emit(DatePickerInitialState());//set the initial value of text field
//   }
// }
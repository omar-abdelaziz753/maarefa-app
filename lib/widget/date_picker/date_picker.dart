// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_academy/res/drawable/icon/icons.dart';
// import 'package:my_academy/res/value/color/color.dart';
// import 'package:my_academy/res/value/style/textstyles.dart';

// import '../../bloc/date_picker/date_picker_cubit.dart';
// class DatePickerWidget extends StatelessWidget {
//   const DatePickerWidget({Key? key, required this.labelText}) : super(key: key);
//   final String labelText;
//   @override
//   Widget build(BuildContext context) {
//     final bloc = DatePickerCubit.get(context);
//     return BlocProvider(
//         create: (BuildContext context) => DatePickerCubit()..initDateState(),
//         child: BlocConsumer<DatePickerCubit,DatePickerState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             return Material(
//               child: TextField(
//                 controller: bloc.dateInput,
//                 decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     suffixIcon: Image.asset(calendarIcon),
//                     labelText: labelText,
//                     labelStyle:
//                         TextStyles.errorStyle.copyWith(color: sufixtextColor)),
//                 readOnly: true,
//                 onTap:()=>bloc.datePicker()
//               ),
//             );
//           },
//         ));
//   }
// }
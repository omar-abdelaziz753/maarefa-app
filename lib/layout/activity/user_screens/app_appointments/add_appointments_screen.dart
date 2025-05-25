// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_academy/layout/card_view/day_card/day_card.dart';

// import '../../../../res/value/color/color.dart';
// import '../../../../res/value/style/textstyles.dart';
// import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
// import '../../../../widget/buttons/master/master_button.dart';
// import '../../../../widget/date_picker/date_picker.dart';
// import '../../../../widget/date_picker/time_picker.dart';
// import '../../../../widget/side_padding/side_padding.dart';
// import '../../../../widget/space/space.dart';

// class AddAppointments extends StatefulWidget {
//   const AddAppointments({Key? key}) : super(key: key);

//   @override
//   State<AddAppointments> createState() => _AddAppointmentsState();
// }

// class _AddAppointmentsState extends State<AddAppointments> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar(title: tr("add_appointments")),
//       body: SidePadding(
//         sidePadding: 30,
//         child: ListView(children: [
//           Text(
//             tr("course"),
//             style: TextStyles.contentStyle,
//           ),
//           const Space(
//             boxHeight: 30,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Expanded(child: DatePickerWidget(labelText: tr("start_date"))),
//               const Space(
//                 boxWidth: 10,
//               ),
//               Expanded(child: DatePickerWidget(labelText: tr("end_date"))),
//             ],
//           ),
//           const Space(
//             boxHeight: 30,
//           ),
//           Row(
//             children: [
//               Expanded(child: TimePickerWidget(labelText: tr("time_from"))),
//               const Space(
//                 boxWidth: 10,
//               ),
//               Expanded(child: TimePickerWidget(labelText: tr("time_to"))),
//             ],
//           ),
//           const Space(
//             boxHeight: 30,
//           ),
//           ExpansionTile(
//             title: Text(
//               tr("days"),
//               style: TextStyles.titleStyle.copyWith(color: mainColor),
//             ),
//           ),
//           const Space(
//             boxHeight: 10,
//           ),
//           Row(
//             children: const [
//               DayCard(),
//               DayCard(),
//             ],
//           ),
//           const Space(
//             boxHeight: 200,
//           ),
//           MasterButton(
//             buttonText: tr("add_group"),
//             buttonColor: profileColor,
//             borderColor: profileColor,
//             buttonStyle: TextStyles.hintStyle
//                 .copyWith(color: mainColor, fontSize: 18.sp),
//             onPressed: () {},
//           ),
//           const Space(
//             boxHeight: 10,
//           ),
//           MasterButton(
//             buttonText: tr("save"),
//             onPressed: () {},
//           ),
//         ]),
//       ),
//     );
//   }
// }

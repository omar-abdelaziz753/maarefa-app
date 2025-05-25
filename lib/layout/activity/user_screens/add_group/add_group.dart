// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_academy/res/value/color/color.dart';
// import 'package:my_academy/res/value/style/textstyles.dart';
// import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
// import 'package:my_academy/widget/buttons/master/master_button.dart';
// import 'package:my_academy/widget/side_padding/side_padding.dart';
// import 'package:my_academy/widget/space/space.dart';

// import '../../../../widget/date_picker/date_picker.dart';
// import '../../../../widget/date_picker/time_picker.dart';
// import '../../../card_view/table_from_to_card/table_modify_card.dart';

// class AddGroup extends StatelessWidget {
//   const AddGroup({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar(title: tr("add_appointments")),
//       body: SidePadding(
//         sidePadding: 30,
//         child: ListView(
//           children: [
//             Text(
//               tr("course"),
//               style: TextStyles.contentStyle,
//             ),
//             const Space(
//               boxHeight: 30,
//             ),
//             Text(
//               "مجموعة رقم 1",
//               style:
//                   TextStyles.contentStyle.copyWith(color: black, fontSize: 16),
//             ),
//             const Space(
//               boxHeight: 20,
//             ),
//             const TableModifyCard(),
//             const Space(
//               boxHeight: 20,
//             ),
//             const Divider(
//               thickness: 1,
//             ),
//             const Space(
//               boxHeight: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(child: DatePickerWidget(labelText: tr("start_date"))),
//                 const Space(
//                   boxWidth: 10,
//                 ),
//                 Expanded(child: DatePickerWidget(labelText: tr("end_date"))),
//               ],
//             ),
//             const Space(
//               boxHeight: 30,
//             ),
//             Row(
//               children: [
//                 Expanded(child: TimePickerWidget(labelText: tr("time_from"))),
//                 const Space(
//                   boxWidth: 10,
//                 ),
//                 Expanded(child: TimePickerWidget(labelText: tr("time_to"))),
//               ],
//             ),
//             const Space(
//               boxHeight: 20,
//             ),
//             ExpansionTile(
//               title: Text(
//                 tr("days"),
//                 style: TextStyles.titleStyle.copyWith(color: mainColor),
//               ),
//             ),
//             const Space(
//               boxHeight: 50,
//             ),
//             MasterButton(
//               buttonText: tr("add_group"),
//               buttonColor: profileColor,
//               borderColor: profileColor,
//               buttonStyle: TextStyles.hintStyle
//                   .copyWith(color: mainColor, fontSize: 18.sp),
//               onPressed: () {},
//             ),
//             const Space(
//               boxHeight: 10,
//             ),
//             MasterButton(
//               buttonText: tr("save"),
//               onPressed: () {},
//             ),
//             const Space(
//               boxHeight: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

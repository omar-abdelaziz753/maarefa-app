// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_academy/res/drawable/icon/icons.dart';
// import 'package:my_academy/res/value/color/color.dart';
// import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
// import 'package:my_academy/res/value/style/textstyles.dart';
// import 'package:my_academy/widget/calender_table/calender_table.dart';
// import 'package:my_academy/widget/side_padding/side_padding.dart';

// import '../../../../res/drawable/image/images.dart';
// import '../../../../widget/alert/alert_messege.dart';
// import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
// import '../../../../widget/buttons/master/master_button.dart';
// import '../../../../widget/space/space.dart';

// class TableScreen extends StatelessWidget {
//   const TableScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar(title: tr("table")),
//       body: SidePadding(
//         sidePadding: 35,
//         child: ListView(
//           children: [
//             const Space(
//               boxHeight: 40,
//             ),
//             Text(
//               tr("setadate"),
//               style: TextStyles.subTitleStyle.copyWith(color: grey),
//             ),
//             const Space(
//               boxHeight: 30,
//             ),
//             const ClanderTable(),
//             const Space(
//               boxHeight: 30,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       tr("available_hours"),
//                       style: TextStyles.appBarStyle
//                           .copyWith(color: black, fontWeight: FontWeight.bold),
//                     ),
//                     InkWell(
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             plusIcon,
//                             width: 15.w,
//                           ),
//                           const Space(
//                             boxWidth: 5,
//                           ),
//                           Text(
//                             tr(
//                               "add_appointment",
//                             ),
//                             style: TextStyles.contentStyle
//                                 .copyWith(color: mainColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Space(
//                   boxHeight: 10,
//                 ),
//                 Text(tr("make_appointment"),
//                     style: TextStyles.subTitleStyle.copyWith(
//                       color: grey,
//                     )),
//               ],
//             ),
//             const Space(
//               boxHeight: 20,
//             ),
//             Container(
//               height: 100.h,
//               width: screenWidth,
//               color: profileColor,
//               child: Image.asset(
//                 clockImage,
//                 width: 80.w,
//                 height: 80.h,
//               ),
//             ),
//             const Space(
//               boxHeight: 50,
//             ),
//             MasterButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return const SimpleAlert();
//                       });
//                 },
//                 sidePadding: 0,
//                 buttonWidth: screenWidth,
//                 buttonText: tr("confirm")),
//             const Space(
//               boxHeight: 100,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

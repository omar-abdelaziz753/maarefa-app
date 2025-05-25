// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_academy/res/value/color/color.dart';
// import 'package:my_academy/res/value/style/textstyles.dart';
// import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
// import 'package:my_academy/widget/buttons/master/master_button.dart';
// import 'package:my_academy/widget/side_padding/side_padding.dart';
// import 'package:my_academy/widget/space/space.dart';
//
// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar(title: tr("notifications")),
//       body: SidePadding(
//         sidePadding: 35,
//         child: ListView(
//           children: [
//
//             Space(
//               boxHeight: 20.h,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   tr("go_to_payment"),
//                   style: TextStyles.subTitleStyle.copyWith(color: txtColor),
//                 ),
//                 Space(
//                   boxHeight: 10.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     MasterButton(
//                         onPressed: () {},
//                         sidePadding: 0,
//                         buttonWidth: 150.w,
//                         buttonHeight: 60.h,
//                         buttonText: tr("go_to_pay")),
//                     Text(
//                       "20/1/2022 , 13:00",
//                       style: TextStyles.contentStyle.copyWith(color: timeColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Space(
//               boxHeight: 30.h,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   tr("awaiting_response"),
//                   style: TextStyles.subTitleStyle.copyWith(color: txtColor),
//                 ),
//                 Space(
//                   boxHeight: 10.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       textAlign: TextAlign.center,
//                       "20/1/2022 , 13:00",
//                       style: TextStyles.contentStyle.copyWith(color: timeColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Space(
//               boxHeight: 30.h,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   tr("awaiting_response"),
//                   style: TextStyles.subTitleStyle.copyWith(color: txtColor),
//                 ),
//                 Space(
//                   boxHeight: 10.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       textAlign: TextAlign.center,
//                       "20/1/2022 , 13:00",
//                       style: TextStyles.contentStyle.copyWith(color: timeColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Space(
//               boxHeight: 20.h,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

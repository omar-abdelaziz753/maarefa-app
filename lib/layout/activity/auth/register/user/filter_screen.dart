// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_academy/res/value/color/color.dart';
// import 'package:my_academy/res/value/style/textstyles.dart';
// import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
// import 'package:my_academy/widget/side_padding/side_padding.dart';
// import 'package:my_academy/widget/slider/slider_container.dart';
// import 'package:my_academy/widget/space/space.dart';
// import 'package:my_academy/widget/textfield/master/master_textfield.dart';
//
// import '../../../../../widget/buttons/master/master_button.dart';
//
// class FilterScreen extends StatelessWidget {
//   const FilterScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar(title: tr("filter")),
//       body: SidePadding(
//         sidePadding: 15,
//         child: ListView(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   tr("subject"),
//                   style: TextStyles.agreeStyle.copyWith(color: black),
//                 ),
//                 const Icon(
//                   Icons.expand_less,
//                   color: grey,
//                   size: 40,
//                 ),
//               ],
//             ),
//             Space(
//               boxHeight: 20.h,
//             ),
//             Wrap(
//               children: List.generate(
//                   15,
//                   (index) => Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
//                       child: ChoiceChip(
//                           backgroundColor: white,
//                           shape: RoundedRectangleBorder(
//                               side: const BorderSide(color: textfieldColor),
//                               borderRadius: BorderRadius.circular(25.r)),
//                           onSelected: (t) {},
//                           selectedColor: mainColor,
//                           label: Text(
//                               index.isEven ? "إدارة اعمال" : "رسم ديجيتال",
//                               style: TextStyles.unselectedStyle),
//                           selected: false))),
//             ),
//             Space(
//               boxHeight: 20.h,
//             ),
//             const Divider(
//               thickness: 3,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   tr("academic_year"),
//                   style: TextStyles.agreeStyle.copyWith(color: black),
//                 ),
//                 const Icon(
//                   Icons.expand_less,
//                   color: grey,
//                   size: 40,
//
//                 ),
//               ],
//             ),
//             Space(
//               boxHeight: 20.h,
//             ),
//             Wrap(
//               children: List.generate(
//                   9,
//                   (index) => Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
//                       child: ChoiceChip(
//                           backgroundColor: white,
//                           shape: RoundedRectangleBorder(
//                               side: const BorderSide(color: textfieldColor),
//                               borderRadius: BorderRadius.circular(25.r)),
//                           onSelected: (t) {},
//                           selectedColor: mainColor,
//                           label: Text(index.isEven ? "سنة اولى" : "سنة تانية",
//                               style: TextStyles.unselectedStyle),
//                           selected: false))),
//             ),
//             Space(
//               boxHeight: 20.h,
//             ),
//             const Divider(
//               thickness: 3,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   tr("price_per_hour"),
//                   style: TextStyles.agreeStyle.copyWith(color: black),
//                 ),
//                 const Icon(
//                   Icons.expand_less,
//                   color: grey,
//                   size: 40,
//                 ),
//               ],
//             ),
//             Space(
//               boxHeight: 20.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         tr("from"),
//                         style: TextStyles.agreeStyle,
//                       ),
//                       const MasterTextField(
//                         hintText: "",
//                         prefixIcon: null,
//                         fieldHeight: 50,
//                       )
//                     ],
//                   ),
//                 ),
//                 Space(
//                   boxWidth: 10.w,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         tr("to"),
//                         style: TextStyles.agreeStyle,
//                       ),
//                       const MasterTextField(
//                         hintText: "",
//                         prefixIcon: null,
//                         fieldHeight: 50,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Space(
//               boxHeight: 20.h,
//             ),
//             const SliderContainer(),
//             Space(
//               boxHeight: 20.h,
//             ),
//             const Divider(
//               thickness: 3,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child:
//                       MasterButton(onPressed: () {}, buttonText: tr("filter")),
//                 ),
//                 Space(
//                   boxWidth: 10.w,
//                 ),
//                 Expanded(
//                   child: MasterButton(
//                     buttonColor: profileColor,
//                     borderColor: profileColor,
//                     onPressed: () {},
//                     buttonText: tr("clear_filter"),
//                     buttonStyle:
//                         TextStyles.appBarStyle.copyWith(color: mainColor),
//                   ),
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

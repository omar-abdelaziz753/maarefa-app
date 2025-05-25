// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
// import 'package:my_academy/widget/master_list/custom_list.dart';
// import 'package:my_academy/widget/subscribers/subscribers_items.dart';

// import '../../../../widget/app_bar/subscribers/subscribers_app_bar.dart';

// class SubscribersScreen extends StatelessWidget {
//   const SubscribersScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: SubscribersAppBar(
//             title: tr("subscribers"), subTitle: tr("subscriber")),
//         body: ListView(
//           children: [
//             CustomList(
//               child: (context, index) => const SubscribersItems(),
//               axis: Axis.vertical,
//               listHeight: screenHeight,
//               count: 20,
//               scroll: const NeverScrollableScrollPhysics(),
//             ),
//           ],
//         ));
//   }
// }

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_academy/res/drawable/image/images.dart';
// import 'package:my_academy/widget/textfield/master/master2_textfiled.dart';
// import '../../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
// import '../../../../../widget/buttons/master/master_button.dart';
// import '../../../../../widget/side_padding/side_padding.dart';
// import '../../../../../widget/space/space.dart';
//
// class ContactUsScreen extends StatelessWidget {
//   const ContactUsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: FractionalOffset.topCenter,
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           // color: Colors.red,
//           child: Image.asset(
//             staticBackground,
//             fit: BoxFit.fill,
//           ),
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: DefaultAppBar(title: tr("contact_us")),
//           body: ListView(
//             children: [
//               const Space(
//                 boxHeight: 40,
//               ),
//               SidePadding(
//                 sidePadding: 35,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 300.h,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(image: AssetImage(contact)),
//                       ),
//                     ),
//                     Space(
//                       boxHeight: 10.h,
//                     ),
//                   ],
//                 ),
//               ),
//               Space(boxHeight: 10.h),
//               Master2TextField(
//                 sidePadding: 35,
//                 hintText: tr("name"),
//               ),
//               Space(
//                 boxHeight: 30.h,
//               ),
//               Master2TextField(
//                 sidePadding: 35,
//                 hintText: tr("phone2"),
//               ),
//               Space(
//                 boxHeight: 30.h,
//               ),
//               Master2TextField(
//                 sidePadding: 35,
//                 hintText: tr("email"),
//               ),
//               Space(
//                 boxHeight: 30.h,
//               ),
//               Master2TextField(
//                 sidePadding: 35,
//                 hintText: tr("messege"),
//                 maxLines: 5,
//                 minLines: 5,
//                 fieldHeight: 210,
//               ),210
//               Space(
//                 boxHeight: 30.h,
//               ),
//               MasterButton(
//                   onPressed: () {}, sidePadding: 35, buttonText: tr("send")),
//               const Space(
//                 boxHeight: 100,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class AppTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String phone;
//   AppTextField({this.controller, required this.phone});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           'كود التأكيد',
          
//         ),
//         Text(
//           'من فضلك قم بإدخال كود التأكيد تم ارساله على رقم الهاتف',
          
//         ),
//         Text(phone,),
//         Container(
//           padding: EdgeInsets.only(
//             top: height(20),
//             left: width(25),
//             right: width(25),
//           ),
//           child: Directionality(
//             textDirection: TextDirection.ltr,
//             child: Pinput(
//               controller: controller,
//               defaultPinTheme: PinTheme(
//                 width: width(55),
//                 height: height(70),
//                 margin: EdgeInsets.all(width(4)),
//                 textStyle: loginNumber,
//                 decoration: BoxDecoration(
//                   // color: Colors.green,
//                   borderRadius: BorderRadius.all(
//                       Radius.circular(radius(10))),
//                 ),
//               ),
//               submittedPinTheme: PinTheme(
//                 width: width(55),
//                 height: height(70),
//                 margin: EdgeInsets.all(width(4)),
//                 textStyle: loginNumber,
//                 decoration: BoxDecoration(
//                   // color: Colors.deepPurpleAccent,
//                   border: Border.all(color: Color(0xFFD5E8EB)),
//                   borderRadius: BorderRadius.all(
//                       Radius.circular(radius(25))),
//                 ),
//               ),
//               focusedPinTheme: PinTheme(
//                 width: width(55),
//                 height: height(70),
//                 margin: EdgeInsets.all(width(4)),
//                 textStyle: loginNumber,
//                 decoration: BoxDecoration(
//                   // color: Colors.greenAccent,
//                   border: Border.all(color: Color(0xFFA2E3EE)),
//                   borderRadius: BorderRadius.all(
//                       Radius.circular(radius(25))),
//                 ),
//               ),
//               followingPinTheme: PinTheme(
//                 width: width(55),
//                 height: height(70),
//                 margin: EdgeInsets.all(width(4)),
//                 textStyle: loginNumber,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFFD5E8EB)),
//                   // color: Colors.black,
//                   borderRadius: BorderRadius.all(
//                       Radius.circular(radius(25))),
//                 ),
//               ),
//               pinContentAlignment: Alignment.center,
//               autofocus: true,
//               pinputAutovalidateMode:
//               PinputAutovalidateMode.disabled,
//               keyboardType: TextInputType.number,
//               length: 4,
//               // focusNode: provider.pin,
//               // controller: provider.code,
//               // onSubmit: (pin) {
//               //   provider.activate(widget.email);
//               // },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
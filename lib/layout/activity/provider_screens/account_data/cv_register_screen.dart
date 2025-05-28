// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:my_academy/bloc/auth/provider/auth_provider_cubit.dart';
// import 'package:my_academy/res/value/dimenssion/dimenssions.dart';

// import '../../../../repository/provider/auth_provider/auth_provider_repository.dart';
// import '../../../../res/drawable/image/images.dart';
// import '../../../../res/value/color/color.dart';
// import '../../../../res/value/style/textstyles.dart';
// import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
// import '../../../../widget/buttons/master/master_button.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';

// import '../../../../widget/side_padding/side_padding.dart';
// import '../../../../widget/space/space.dart';
// import '../main/main_screen.dart';

// class CVRegisterScreen extends StatelessWidget {
//   final Map<String, dynamic> data;
//   const CVRegisterScreen({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (BuildContext context) =>
//             AuthProviderCubit(AuthProviderRepository()),
//         child: BlocConsumer<AuthProviderCubit, AuthProviderState>(
//             listener: (context, state) {},
//             builder: (context, state) {
//               // final bloc = AuthCubit.get(context);
//               return Scaffold(
//                 appBar: DefaultAppBar(title: tr("register")),
//                 body: ListView(
//                   children: [
//                     const Space(
//                       boxHeight: 35,
//                     ),
//                     const SidePadding(
//                       sidePadding: 15,
//                       child: StepProgressIndicator(
//                         totalSteps: 5,
//                         currentStep: 5,
//                         selectedColor: mainColor,
//                         unselectedColor: textfieldColor,
//                       ),
//                     ),
//                     const Space(
//                       boxHeight: 20,
//                     ),
//                     SidePadding(
//                       sidePadding: 15,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             tr("cv"),
//                             style: TextStyles.introStyle.copyWith(
//                                 color: blackColor, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             tr("choose_cv"),
//                             textAlign: TextAlign.start,
//                             style: TextStyles.hintStyle,
//                           ),
//                           const Space(
//                             boxHeight: 25,
//                           ),
//                           InkWell(
//                             onTap: ()=>bloc.,
//                             child: Container(
//                               height: 170.h,
//                               width: screenWidth,
//                               decoration: BoxDecoration(
//                                 color: cvBackgroundColor,
//                                 borderRadius: BorderRadius.circular(5.r),
//                               ),
//                               child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Image.asset(cv,
//                                         height: 100, fit: BoxFit.contain),
//                                     Text(tr("cv"),
//                                         style: TextStyles.subTitleStyle.copyWith(
//                                             color: cvColor, fontSize: 17.sp)),
//                                   ]),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Space(
//                       boxHeight: screenHeight / 3,
//                     ),
//                     MasterButton(
//                         onPressed: () {
//                           Get.to(() => const ProviderMainScreen());
//                         },
//                         sidePadding: 15,
//                         buttonText: tr("next")),
//                     const Space(
//                       boxHeight: 100,
//                     ),
//                   ],
//                 ),
//               );
//             }));
//   }
// }

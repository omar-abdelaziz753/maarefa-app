// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:my_academy/layout/activity/provider_screens/add_contant/add_content_screen.dart';
// import 'package:my_academy/res/drawable/image/images.dart';
// import 'package:my_academy/res/value/color/color.dart';
// import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
// import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
// import 'package:my_academy/widget/buttons/master/master_button.dart';
// import 'package:my_academy/widget/side_padding/side_padding.dart';

// import '../../../../bloc/content/content_cubit.dart';
// import '../../../../repository/provider/lessons/lessons_repository.dart';
// import '../../../../res/value/style/textstyles.dart';
// import '../../../../widget/space/space.dart';
// import 'add_course_screen.dart';

// class SideContentScreen extends StatelessWidget {
//   const SideContentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (BuildContext context) =>
//             ContentCubit(ProviderLessonsRepository()),
//         child: BlocConsumer<ContentCubit, ContentState>(
//             listener: (context, state) {},
//             builder: (context, state) {
//               final bloc = ContentCubit.get(context);
//               return Scaffold(
//                 appBar: DefaultAppBar(title: tr("add_content")),
//                 body: SidePadding(
//                   sidePadding: 15,
//                   child: ListView(
//                     children: [
//                       SidePadding(
//                         sidePadding: bloc.selectedContent == 1 ? 0 : 20,
//                         child: InkWell(
//                           onTap: () => bloc.selectContent(1),
//                           child: Card(
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             elevation: 0.0,
//                             semanticContainer: true,
//                             shape: RoundedRectangleBorder(
//                                 side: BorderSide(
//                                     color: bloc.selectedContent == 1
//                                         ? transparent
//                                         : textfieldColor),
//                                 borderRadius: BorderRadius.circular(5.r)),
//                             child: Container(
//                               width: screenWidth,
//                               decoration: BoxDecoration(
//                                 image: bloc.selectedContent == 1
//                                     ? const DecorationImage(
//                                         image: AssetImage(blueBackground),
//                                         fit: BoxFit.cover)
//                                     : null,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Image.asset(penFlower,
//                                         height: 130.h,
//                                         width: 100.w,
//                                         fit: BoxFit.contain),
//                                     const Space(
//                                       boxHeight: 30,
//                                     ),
//                                     Text(tr("courses"),
//                                         textAlign: TextAlign.center,
//                                         style: bloc.selectedContent == 1
//                                             ? TextStyles.appBarStyle.copyWith(
//                                                 color: white, fontSize: 22)
//                                             : TextStyles.appBarStyle.copyWith(
//                                                 color: grey, fontSize: 16))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Space(
//                         boxHeight: 10,
//                       ),
//                       InkWell(
//                         onTap: () => bloc.selectContent(2),
//                         child: Stack(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 top: 10.0,
//                                 right: bloc.selectedContent == 2 ? 0 : 20,
//                                 left: bloc.selectedContent == 2 ? 0 : 20,
//                               ),
//                               child: Card(
//                                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                                 elevation: 0.0,
//                                 semanticContainer: true,
//                                 shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                         color: bloc.selectedContent == 2
//                                             ? transparent
//                                             : textfieldColor),
//                                     borderRadius: BorderRadius.circular(5.r)),
//                                 child: Container(
//                                   width: screenWidth,
//                                   height: screenHeight * 0.25,
//                                   decoration: BoxDecoration(
//                                     image: bloc.selectedContent == 2
//                                         ? const DecorationImage(
//                                             image: AssetImage(blueBackground),
//                                             fit: BoxFit.cover)
//                                         : null,
//                                   ),
//                                   // child:
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: -40,
//                               child: SizedBox(
//                                 width: screenWidth - 60.w,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       mobileImage,
//                                       height: screenHeight * 0.25,
//                                       // width: 250.w,
//                                       fit: BoxFit.contain,
//                                     ),
//                                     Text(tr("private_lessons"),
//                                         textAlign: TextAlign.center,
//                                         style: bloc.selectedContent == 2
//                                             ? TextStyles.appBarStyle.copyWith(
//                                                 color: white, fontSize: 22)
//                                             : TextStyles.appBarStyle.copyWith(
//                                                 color: grey, fontSize: 16))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Space(
//                         boxHeight: 40,
//                       ),
//                       MasterButton(
//                         // buttonStyle:
//                         //     TextStyles.appBarStyle.copyWith(color: mainColor),
//                         buttonText: tr("next"),
//                         onPressed: () => bloc.selectedContent == 1
//                             ? Get.to(() => const AddCourseScreen())
//                             : Get.to(() => const AddContentScreen()),
//                       ),
//                       const Space(
//                         boxHeight: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }));
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/provider_screens/add_contant/add_content_screen.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

import '../../../../bloc/content/content_cubit.dart';
import '../../../../repository/provider/lessons/lessons_repository.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/space/space.dart';
import 'add_course_screen.dart';

class SideContentScreen extends StatelessWidget {
  const SideContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            ContentCubit(ProviderLessonsRepository()),
        child: BlocConsumer<ContentCubit, ContentState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = ContentCubit.get(context);
            return Scaffold(
              appBar: DefaultAppBar(title: tr("add_content")),
              body: SidePadding(
                sidePadding: 20,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () => bloc.selectContent(1),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: bloc.selectedContent == 1 ? mainColor : white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: bloc.selectedContent == 1
                              ? [
                                  BoxShadow(
                                    color: mainColor.withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  )
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              penFlower,
                              height: 120.h,
                              fit: BoxFit.contain,
                              color: bloc.selectedContent == 1 ? white : null,
                            ),
                            const Space(boxHeight: 20),
                            Text(
                              tr("courses"),
                              textAlign: TextAlign.center,
                              style: TextStyles.appBarStyle.copyWith(
                                color: bloc.selectedContent == 1 ? white : grey,
                                fontSize: bloc.selectedContent == 1 ? 24 : 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => bloc.selectContent(2),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: bloc.selectedContent == 2 ? mainColor : white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: bloc.selectedContent == 2
                              ? [
                                  BoxShadow(
                                    color: mainColor.withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  )
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              mobileImage,
                              height: 130.h,
                              fit: BoxFit.contain,
                              color: bloc.selectedContent == 2 ? white : null,
                            ),
                            const Space(boxHeight: 20),
                            Text(
                              tr("private_lessons"),
                              textAlign: TextAlign.center,
                              style: TextStyles.appBarStyle.copyWith(
                                color: bloc.selectedContent == 2 ? white : grey,
                                fontSize: bloc.selectedContent == 2 ? 24 : 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Space(boxHeight: 40),
                    MasterButton(
                      buttonText: tr("next"),
                      // buttonStyle: ElevatedButton.styleFrom(
                      //   backgroundColor: mainColor,
                      //   padding: EdgeInsets.symmetric(vertical: 16.h),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(12.r),
                      //   ),
                      //   elevation: 5,
                      // ),
                      onPressed: () => bloc.selectedContent == 1
                          ? Get.to(() => const AddCourseScreen())
                          : Get.to(() => const AddContentScreen()),
                    ),
                    const Space(boxHeight: 20),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/user_screens/main/main_screen.dart';
import 'package:my_academy/repository/common/educational_stages/educational_stages_repository.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/error/page/error_page.dart';
import 'package:my_academy/widget/loader/loader.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../bloc/educational_stages_years/educational_stages_cubit.dart';
import '../../../../model/common/educational_stages/educational_stages_model.dart';
import '../../../../repository/common/educational_stages/educational_stages_repository.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/loader/loader.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';
import '../../../card_view/class/class_card.dart';
import '../../../card_view/grade/grade_card.dart';
import '../../../view/connectivity/connectivity_view.dart';

// // Enhanced GradeScreen with modern UX
// class GradeScreen extends StatelessWidget {
//   const GradeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Get.offAll(() => const MainScreen());
//         return true;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.grey[50],
//         body: ConnectivityView(
//           child: BlocProvider(
//             create: (BuildContext context) =>
//             EducationalStagesCubit(EducationalStagesRepository())
//               ..getEducationalStages(),
//             child: BlocConsumer<EducationalStagesCubit, EducationalStagesState>(
//               listener: (context, state) {
//                 if (state is EducationalStagesErrorState) {
//                   _showErrorSnackBar(context);
//                 }
//               },
//               builder: (context, state) {
//                 return CustomScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   slivers: [
//                     _buildSliverAppBar(context),
//                     _buildContent(context, state),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSliverAppBar(BuildContext context) {
//     return SliverAppBar(
//       expandedHeight: 120.h,
//       floating: false,
//       pinned: true,
//       elevation: 0,
//       backgroundColor: mainColor,
//       leading: IconButton(
//         icon: Container(
//           padding: EdgeInsets.all(8.w),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.2),
//             borderRadius: BorderRadius.circular(12.r),
//           ),
//           child: Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.white,
//             size: 18.w,
//           ),
//         ),
//         onPressed: () => Get.offAll(() => const MainScreen()),
//       ),
//       flexibleSpace: FlexibleSpaceBar(
//         title: Text(
//           tr("select_your_grade"),
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.sp,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         titlePadding: EdgeInsets.only(left: 60.w, bottom: 16.h),
//         background: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 mainColor,
//                 mainColor.withOpacity(0.8),
//               ],
//             ),
//           ),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: -50.w,
//                 top: -50.h,
//                 child: Container(
//                   width: 200.w,
//                   height: 200.h,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white.withOpacity(0.1),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 20.w,
//                 top: 60.h,
//                 child: Icon(
//                   Icons.school,
//                   size: 40.w,
//                   color: Colors.white.withOpacity(0.3),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContent(BuildContext context, EducationalStagesState state) {
//     if (state is EducationalStagesLoadedState) {
//       return SliverToBoxAdapter(
//         child: EnhancedYearsView(stages: state.data),
//       );
//     } else if (state is EducationalStagesErrorState) {
//       return SliverFillRemaining(
//         child: _buildErrorState(context),
//       );
//     } else {
//       return SliverFillRemaining(
//         child: _buildLoadingState(),
//       );
//     }
//   }
//
//   Widget _buildLoadingState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(mainColor),
//             strokeWidth: 3,
//           ),
//           SizedBox(height: 16.h),
//           Text(
//             tr("loading_grades"),
//             style: TextStyles.unselectedStyle.copyWith(
//               color: Colors.grey[600],
//               fontSize: 14.sp,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildErrorState(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.error_outline,
//             size: 64.w,
//             color: Colors.red[300],
//           ),
//           SizedBox(height: 16.h),
//           Text(
//             tr("error_loading_grades"),
//             style: TextStyles.unselectedStyle.copyWith(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(height: 24.h),
//           ElevatedButton.icon(
//             onPressed: () {
//               BlocProvider.of<EducationalStagesCubit>(context)
//                   .getEducationalStages();
//             },
//             icon: const Icon(Icons.refresh),
//             label: Text(tr("retry")),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: mainColor,
//               foregroundColor: Colors.white,
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.r),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showErrorSnackBar(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(tr("error_loading_grades")),
//         backgroundColor: Colors.red[400],
//         action: SnackBarAction(
//           label: tr("retry"),
//           textColor: Colors.white,
//           onPressed: () {
//             BlocProvider.of<EducationalStagesCubit>(context)
//                 .getEducationalStages();
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // Enhanced YearsView with professional UX
// class EnhancedYearsView extends StatelessWidget {
//   final List<EducationalStageModel> stages;
//   const EnhancedYearsView({super.key, required this.stages});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) =>
//       EducationalStagesCubit(EducationalStagesRepository())
//         ..getEducationalYears(),
//       child: BlocConsumer<EducationalStagesCubit, EducationalStagesState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return BlocBuilder<EducationalStagesCubit, EducationalStagesState>(
//             builder: (context, state) {
//               if (state is EducationalYearsLoadedState) {
//                 final data = state.data;
//                 return _buildYearsView(context, data);
//               } else if (state is EducationalYearsErrorState) {
//                 return const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: ErrorPage(),
//                 );
//               } else {
//                 return const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Loading(),
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildYearsView(BuildContext context, dynamic data) {
//     return BlocProvider(
//       create: (BuildContext context) =>
//           EducationalStagesCubit(EducationalStagesRepository()),
//       child: BlocConsumer<EducationalStagesCubit, EducationalStagesState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           final bloc = EducationalStagesCubit.get(context);
//           return Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildStagesSection(context, bloc),
//                 if (bloc.yearsModel.isNotEmpty) ...[
//                   SizedBox(height: 32.h),
//                   _buildYearsSection(context, bloc, data),
//                 ],
//                 SizedBox(height: 40.h),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildStagesSection(BuildContext context, EducationalStagesCubit bloc) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               padding: EdgeInsets.all(8.w),
//               decoration: BoxDecoration(
//                 color: mainColor.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               child: Icon(
//                 Icons.layers,
//                 color: mainColor,
//                 size: 20.w,
//               ),
//             ),
//             SizedBox(width: 12.w),
//             Text(
//               tr("educational_stages"),
//               style: TextStyles.agreeStyle.copyWith(
//                 color: blackColor,
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.h),
//         ...stages.asMap().entries.map((entry) {
//           final index = entry.key;
//           final stage = entry.value;
//           return Padding(
//             padding: EdgeInsets.only(bottom: 12.h),
//             child: _buildEnhancedStageCard(context, bloc, stage, index),
//           );
//         }).toList(),
//       ],
//     );
//   }
//
//   Widget _buildEnhancedStageCard(
//       BuildContext context,
//       EducationalStagesCubit bloc,
//       EducationalStageModel stage,
//       int index,
//       ) {
//     final isSelected = bloc.isSelect == index;
//
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//       decoration: BoxDecoration(
//         color: isSelected ? mainColor.withOpacity(0.1) : Colors.white,
//         borderRadius: BorderRadius.circular(16.r),
//         border: Border.all(
//           color: isSelected ? mainColor : Colors.grey[200]!,
//           width: isSelected ? 2 : 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: isSelected
//                 ? mainColor.withOpacity(0.2)
//                 : Colors.black.withOpacity(0.05),
//             blurRadius: isSelected ? 8 : 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16.r),
//           onTap: () => bloc.selectStage(index, stages),
//           child: Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Row(
//               children: [
//                 Container(
//                   width: 50.w,
//                   height: 50.w,
//                   decoration: BoxDecoration(
//                     color: isSelected ? mainColor : Colors.grey[100],
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                   child: Icon(
//                     _getStageIcon(stage.name ?? ''),
//                     color: isSelected ? Colors.white : Colors.grey[600],
//                     size: 24.w,
//                   ),
//                 ),
//                 SizedBox(width: 16.w),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         stage.name ?? '',
//                         style: TextStyles.unselectedStyle.copyWith(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600,
//                           color: isSelected ? mainColor : blackColor,
//                         ),
//                       ),
//                       SizedBox(height: 4.h),
//                       Text(
//                         tr("tap_to_select"),
//                         style: TextStyles.unselectedStyle.copyWith(
//                           fontSize: 12.sp,
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 AnimatedRotation(
//                   turns: isSelected ? 0.5 : 0,
//                   duration: const Duration(milliseconds: 300),
//                   child: Icon(
//                     Icons.keyboard_arrow_down,
//                     color: isSelected ? mainColor : Colors.grey[400],
//                     size: 24.w,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildYearsSection(
//       BuildContext context,
//       EducationalStagesCubit bloc,
//       dynamic data,
//       ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: EdgeInsets.all(16.w),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 mainColor.withOpacity(0.1),
//                 mainColor.withOpacity(0.05),
//               ],
//             ),
//             borderRadius: BorderRadius.circular(12.r),
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 Icons.grade,
//                 color: mainColor,
//                 size: 20.w,
//               ),
//               SizedBox(width: 12.w),
//               Text(
//                 tr("available_grades"),
//                 style: TextStyles.agreeStyle.copyWith(
//                   color: mainColor,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const Spacer(),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
//                 decoration: BoxDecoration(
//                   color: mainColor,
//                   borderRadius: BorderRadius.circular(12.r),
//                 ),
//                 child: Text(
//                   "${bloc.yearsModel.length}",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 16.h),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 2.5,
//             crossAxisSpacing: 12.w,
//             mainAxisSpacing: 12.h,
//           ),
//           itemCount: bloc.yearsModel.length,
//           itemBuilder: (context, index) {
//             return _buildEnhancedClassCard(context, bloc, index);
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEnhancedClassCard(
//       BuildContext context,
//       EducationalStagesCubit bloc,
//       int index,
//       ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(12.r),
//           onTap: () {
//             // Handle class selection
//           },
//           child: Container(
//             padding: EdgeInsets.all(12.w),
//             child: Row(
//               children: [
//                 Container(
//                   width: 32.w,
//                   height: 32.w,
//                   decoration: BoxDecoration(
//                     color: mainColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "${index + 1}",
//                       style: TextStyle(
//                         color: mainColor,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 12.w),
//                 Expanded(
//                   child: Text(
//                     bloc.yearsModel[index].name ?? '',
//                     style: TextStyles.unselectedStyle.copyWith(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w600,
//                       color: blackColor,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   size: 14.w,
//                   color: Colors.grey[400],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   IconData _getStageIcon(String stageName) {
//     final name = stageName.toLowerCase();
//     if (name.contains('primary') || name.contains('ابتدائي')) {
//       return Icons.child_care;
//     } else if (name.contains('middle') || name.contains('متوسط')) {
//       return Icons.school;
//     } else if (name.contains('high') || name.contains('ثانوي')) {
//       return Icons.grade;
//     } else {
//       return Icons.book;
//     }
//   }
// }
//
// // Extension for graduation cap icon (if not available in your Icons)
// extension CustomIcons on Icons {
//   static const IconData graduation_cap = Icons.school;
// }

import '../../../../bloc/educational_stages_years/educational_stages_cubit.dart';
import '../../../view/connectivity/connectivity_view.dart';
import '../../../view/years/years/years_view.dart';

class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const MainScreen());
        return true;
      },
      child: Scaffold(
        appBar: DefaultAppBar(
            title: tr("grades"),
            centerTitle: false,
            backPressed: () => Get.offAll(() => const MainScreen())),
        body: ConnectivityView(
          child: BlocProvider(
            create: (BuildContext context) =>
                EducationalStagesCubit(EducationalStagesRepository())
                  ..getEducationalStages(),
            child: BlocConsumer<EducationalStagesCubit, EducationalStagesState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is EducationalStagesLoadedState) {
                  final data = state.data;
                  return YearsView(stages: data);
                } else if (state is EducationalStagesErrorState) {
                  return const ErrorPage();
                } else {
                  return const Loading();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

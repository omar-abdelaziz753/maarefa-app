import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../widget/error/page/error_page.dart';
import '../../../../bloc/cities/cities_cubit.dart';
import '../../../../bloc/home/home_cubit.dart';
import '../../../../bloc/nations/nations_cubit.dart';
import '../../../../model/provider/home/home_db_response.dart';
import '../../../../repository/provider/home/home_repository.dart';
import '../../../../res/drawable/image/images.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/headers/home/home_header.dart';
import '../../../../widget/master_list/custom_list.dart';
import '../../../../widget/row_title/master_row.dart';
import '../../../../widget/space/space.dart';
import '../../../activity/provider_screens/all_course/all_courses_screen.dart';
import '../../../activity/provider_screens/all_subject/all_subject_screen.dart';
import '../../../activity/static/empty_screens/empty_screens.dart';
import '../../../card_view/provider_course/provider_course_card.dart';
import '../../../card_view/provider_current/provider_current_card.dart';
import '../../../card_view/provider_subject/provider_subject_card.dart';
import 'provider_home_cache_view.dart';

class ProviderHomeView extends StatefulWidget {
  const ProviderHomeView({super.key});

  @override
  State<ProviderHomeView> createState() => _ProviderHomeViewState();
}

class _ProviderHomeViewState extends State<ProviderHomeView> {
  @override
  void initState() {
    super.initState();

    context.read<CitiesCubit>().getCitiesInSplash();
    context.read<NationsCubit>().getNationsInSplash();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            HomeCubit(HomeRepository())..getHome(),
        child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                if (state is HomeLoadedState && state.data != null) {
                  final data = (state).data;
                  return homeView(context, data);
                } else if (state is HomeLoadErrorState) {
                  return const ErrorPage();
                } else {
                  return const HomeCacheView();
                }
              });
            }));
  }

  homeView(context, HomeDbResponse? data) {
    return Stack(
      alignment: FractionalOffset.topCenter,
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.45,
          decoration: const BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(75),
                  bottomRight: Radius.circular(75))),
        ),
        // Image.asset(
        //   homeBackground,
        //   width: screenWidth,
        //   height: screenHeight * 0.45,
        //   fit: BoxFit.fill,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space(
              boxHeight: 50,
            ),
            HomeHeader(
              isNotify: false,
              isUser: false,
              data: data,
            ),
            const Space(
              boxHeight: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 35.w,
                left: 35.w,
                top: 10.h,
              ),
              child: Text(
                tr("request"),
                style: TextStyles.titleStyle.copyWith(color: white),
              ),
            ),
            const Space(
              boxHeight: 10,
            ),
            data!.data.currentAction == null
                ? EmptyScreen(
                    title: tr("no_current"),
                    image: emptyCurrent,
                    width: screenWidth,
                    height: 170.h,
                    color: white,
                  )
                : data.data.currentAction!.item == null
                    ? EmptyScreen(
                        title: tr("no_current"),
                        image: emptyCurrent,
                        width: screenWidth,
                        height: 170.h,
                        color: white,
                      )
                    : ProviderCurrentCard(
                        data: data.data.currentAction,
                      ),
            Space(
              boxHeight: screenHeight * 0.09,
            ),
            SizedBox(
              height: screenHeight * 0.5,
              width: screenWidth,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  MasterRow(
                    title: tr("t_courses"),
                    subTitle: tr("view_all_c"),
                    onTap: () => Get.to(() => const ProviderCourseScreen()),
                  ),
                  data.data.courses!.isEmpty || data.data.courses == null
                      ? EmptyScreen(
                          title: tr("no_course"),
                          image: emptyCurrent,
                          width: screenWidth,
                          height: 170.h,
                          color: mainColor.withOpacity(0.3),
                        )
                      : CustomList(
                          listHeight: 10000000000000,
                          listWidth: screenWidth,
                          scroll: const ScrollPhysics(),
                          axis: Axis.vertical,
                          count: data.data.courses!.length,
                          child: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: ProviderCourseCard(
                                data: data.data.courses![index]),
                          ),
                        ),
                  MasterRow(
                    title: tr("courses_offered"),
                    subTitle: tr("view_all_l"),
                    onTap: () => Get.to(() => const ProviderSubjectScreen()),
                  ),
                  // const Space(
                  //   boxHeight: 30,
                  // ),
                  data.data.lessons!.isEmpty || data.data.lessons == null
                      ? EmptyScreen(
                          title: tr("no_lesson"),
                          image: emptyCurrent,
                          width: screenWidth,
                          height: 170.h,
                          color: mainColor.withOpacity(0.3),
                        )
                      : CustomList(
                          listHeight: 10000000000000,
                          listWidth: screenWidth,
                          scroll: const ScrollPhysics(),
                          axis: Axis.vertical,
                          count: data.data.lessons!.length,
                          child: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: ProviderSubjectCard(
                                data: data.data.lessons![index]),
                          ),
                        ),

                  const Space(
                    boxHeight: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

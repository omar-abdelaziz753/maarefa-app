import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/widget/headers/home/home_header.dart';

import '../../../../bloc/cities/cities_cubit.dart';
import '../../../../bloc/home/home_cubit.dart';
import '../../../../bloc/nations/nations_cubit.dart';
import '../../../../bloc/subscribe/subscribe_cubit.dart';
import '../../../../repository/provider/home/home_repository.dart';
import '../../../../res/drawable/image/images.dart';
import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/error/page/error_page.dart';
import '../../../../widget/image_handler/image_from_network/network_image.dart';
import '../../../../widget/master_list/custom_list.dart';
import '../../../../widget/search_home_widget/search_home_widget.dart';
import '../../../../widget/space/space.dart';
import '../../../activity/user_screens/course/course_screen.dart';
import '../../../activity/user_screens/grade/grade_screen.dart';
import '../../../activity/user_screens/offers/offers_screen.dart';
import '../../../card_view/current_subject/current_subject_card.dart';
import '../../../card_view/home/home_card.dart';
import '../../home/user/user_home_cache_view.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
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
            HomeCubit(HomeRepository())..getClientHome(),
        child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                if (state is SliderLoadedState) {
                  final data = (state).data;
                  return profileView(
                    context,
                    data,
                  );

                  // return CurrentSubjectCard(isLive: userCurrentAction.item, type: userCurrentAction.type??"", courseTitle: userCurrentAction.item.title, name: name, price: price, id: id);
                } else if (state is SliderErrorState) {
                  return const ErrorPage();
                } else {
                  return const UserHomeCacheView();
                }
              });
            }));
  }

  profileView(context, data) {
    return ListView(
      children: [
        const Space(
          boxHeight: 25,
        ),
        HomeHeader(
          isUser: true,
          data: data,
        ),
        const Space(
          boxHeight: 25,
        ),
        const SearchHomeWidget(),
        const Space(
          boxHeight: 15,
        ),
        BlocProvider.value(
          value: BlocProvider.of<SubscribeCubit>(context)
            ..getSubscriptionCourseHome()
            ..getSubscriptionLessonHome(),
          child: BlocBuilder<SubscribeCubit, SubscribeState>(
            builder: (context, susState) {
              final bloc = SubscribeCubit.get(context);

              return Column(
                children: [
                  if ((bloc.subscribeCourseModel != null &&
                          bloc.subscribeCourseModel!.liveSubscription!
                              .isNotEmpty) ||
                      (bloc.subscribeSubjectModel != null &&
                          bloc.subscribeSubjectModel!.liveSubscription
                              .isNotEmpty))
                    susState is SubjectSubscriptionLoadedState
                        ? CustomList(
                            listHeight: 100000000000000,
                            listWidth: screenWidth,
                            scroll: const NeverScrollableScrollPhysics(),
                            axis: Axis.vertical,
                            count: bloc
                                .subscribeSubjectModel!.liveSubscription.length,
                            child: (context, index) => Column(
                                  children: [
                                    CurrentSubjectCard(
                                      currentTimeId: bloc
                                          .subscribeSubjectModel!
                                          .liveSubscription[index]
                                          .currentTimeId,
                                      type: "lesson",
                                      isLive: true,
                                      id: bloc.subscribeSubjectModel!
                                          .liveSubscription[index].lesson.id,
                                      courseTitle: bloc
                                          .subscribeSubjectModel!
                                          .liveSubscription[index]
                                          .lesson
                                          .subject!
                                          .name!,
                                      price: bloc
                                          .subscribeSubjectModel!
                                          .liveSubscription[index]
                                          .lesson
                                          .hourPrice!,
                                      name:
                                          "${bloc.subscribeSubjectModel!.liveSubscription[index].lesson.provider.title!} ${bloc.subscribeSubjectModel!.liveSubscription[index].lesson.provider.firstName!} ${bloc.subscribeSubjectModel!.liveSubscription[index].lesson.provider.lastName!}",
                                    ),
                                    const Space(
                                      boxHeight: 15,
                                    ),
                                  ],
                                ))
                        : CustomList(
                            listHeight: 100000000000000,
                            listWidth: screenWidth,
                            scroll: const NeverScrollableScrollPhysics(),
                            axis: Axis.vertical,
                            count: bloc
                                .subscribeCourseModel!.liveSubscription!.length,
                            child: (context, index) => Column(
                                  children: [
                                    CurrentSubjectCard(
                                      currentTimeId: bloc
                                          .subscribeCourseModel!
                                          .liveSubscription![index]
                                          .currentTimeId,
                                      type: "course",
                                      isLive: bloc
                                                  .subscribeCourseModel!
                                                  .liveSubscription![index]
                                                  .course
                                                  .type ==
                                              1
                                          ? false
                                          : true,
                                      image: bloc
                                          .subscribeCourseModel!
                                          .liveSubscription![index]
                                          .course
                                          .image!,
                                      id: bloc.subscribeCourseModel!
                                          .liveSubscription![index].course.id!,
                                      courseTitle: bloc
                                          .subscribeCourseModel!
                                          .liveSubscription![index]
                                          .course
                                          .name!,
                                      price: bloc
                                          .subscribeCourseModel!
                                          .liveSubscription![index]
                                          .course
                                          .price,
                                      name:
                                          "${bloc.subscribeCourseModel!.liveSubscription![index].course.provider.title!} ${bloc.subscribeCourseModel!.liveSubscription![index].course.provider.firstName!} ${bloc.subscribeCourseModel!.liveSubscription![index].course.provider.lastName!}",
                                    ),
                                    const Space(
                                      boxHeight: 15,
                                    ),
                                  ],
                                )),
                  SizedBox(
                    width: screenWidth,
                    height: 245.h,
                    child: Swiper(
                      autoplay: true,
                      itemCount: data.data.offers!.length,
                      viewportFraction: 0.9,
                      scale: 0.92,
                      pagination: SwiperPagination(
                        margin: const EdgeInsets.only(bottom: 8),
                        builder: DotSwiperPaginationBuilder(
                          color: mainColor.withOpacity(0.2),
                          activeColor: accentColor,
                          size: 6.0,
                          activeSize: 8.0,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        final offer = data.data.offers![index];
                        return InkWell(
                          borderRadius: BorderRadius.circular(16.r),
                          onTap: () => Get.to(() => const OffersScreen()),
                          child: Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Top Image
                                  Expanded(
                                    child: CachedImage(
                                      imageUrl: offer.image!,
                                      fit: BoxFit.fill,
                                      width: screenWidth,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  // Offer Title
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      offer.name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.textView16SemiBold
                                          .copyWith(
                                        color: cvColor,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  // Offer Description
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      offer.content!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.hintStyle
                                          .copyWith(fontSize: 13.sp),
                                    ),
                                  ),

                                  // const Spacer(),

                                  // CTA Button (Optional)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0,
                                        bottom: 12.0,
                                        top: 8),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "View Details →",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: accentColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )

                  // SizedBox(
                  //   width: screenWidth,
                  //   height: 260.h,
                  //   child: Swiper(
                  //     autoplay: true,
                  //     itemCount: data.data.offers!.length,
                  //     itemBuilder: (context, index) => InkWell(
                  //       onTap: () => Get.to(() => const OffersScreen()),
                  //       child: Container(
                  //           clipBehavior: Clip.antiAliasWithSaveLayer,
                  //           decoration: BoxDecoration(
                  //               color: white,
                  //               borderRadius: BorderRadius.circular(10.r)),
                  //           height: 250.h,
                  //           width: screenWidth,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Material(
                  //                 borderRadius: BorderRadius.circular(15.r),
                  //                 elevation: 0.5,
                  //                 child: ClipRRect(
                  //                   borderRadius: BorderRadius.circular(15.r),
                  //                   child: CachedImage(
                  //                     imageUrl: data.data.offers![index].image!,
                  //                     width: screenWidth,
                  //                     height: 150,
                  //                     fit: BoxFit.fill,
                  //                   ),
                  //                 ),
                  //               ),
                  //               const Space(boxHeight: 10),
                  //               SidePadding(
                  //                 sidePadding: 15,
                  //                 child: Text(data.data.offers![index].name!,
                  //                     style: TextStyles.textView14SemiBold
                  //                         .copyWith(color: cvColor)),
                  //               ),
                  //               SidePadding(
                  //                 sidePadding: 15,
                  //                 child: Text(data.data.offers![index].content!,
                  //                     maxLines: 2,
                  //                     softWrap: true,
                  //                     overflow: TextOverflow.clip,
                  //                     style: TextStyles.hintStyle),
                  //               ),
                  //             ],
                  //           )),
                  //     ),
                  //     viewportFraction: 0.9,
                  //     scale: .90,
                  //     pagination: SwiperPagination(
                  //       margin: const EdgeInsets.only(bottom: 5),
                  //       builder: DotSwiperPaginationBuilder(
                  //           color: mainColor.withOpacity(0.1),
                  //           activeColor: accentColor),
                  //     ),
                  //   ),
                  // )
                ],
              );
            },
          ),
        ),
        const Space(
          boxHeight: 15,
        ),

        /// Best Teachers
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.h),
              child: Text(
                tr("best_teachers"),
                style: TextStyles.titleStyle.copyWith(color: black),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              // onPressed: () => Get.to(() => const TeachersScreen()),
              child: Text(
                tr("view_all"),
                style: TextStyles.hintStyle.copyWith(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700,
                  decorationColor: grey,
                ),
              ),
            ),
          ],
        ),
        const Space(
          boxHeight: 15,
        ),
        BestTeachersCard(
          teachers: [
            TeacherModel(
              name: "John Doe",
              imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
              subject: "Mathematics",
              rating: 4.5,
            ),
            TeacherModel(
              name: "Jane Smith",
              imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
              subject: "Physics",
              rating: 4.8,
            ),
            TeacherModel(
              name: "Mark Johnson",
              imageUrl: "https://randomuser.me/api/portraits/men/3.jpg",
              subject: "Chemistry",
              rating: 4.6,
            ),
          ],
        ),

        const Space(
          boxHeight: 15,
        ),
        RightHomeCard(
          title: tr("need_subject"),
          buttonText: tr("grades"),
          image: onlineSubject,
          subTitle: tr("subject_available"),
          onTap: () => Get.to(() => const GradeScreen()),
        ),
        LeftHomeCard(
          title: tr("need_course"),
          buttonText: tr("courses"),
          image: course,
          subTitle: tr("course_available"),
          onTap: () => Get.to(() => const CourseScreen()),
        ),
        const Space(
          boxHeight: 50,
        ),
      ],
    );
  }
}

// class BestTeachersCard extends StatelessWidget {
//   final List<TeacherModel> teachers;
//
//   const BestTeachersCard({super.key, required this.teachers});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 210.h,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         itemCount: teachers.length,
//         separatorBuilder: (_, __) => SizedBox(width: 12.w),
//         itemBuilder: (context, index) {
//           final teacher = teachers[index];
//           return GestureDetector(
//             onTap: () {
//               // Navigate to detail screen or perform action
//               // Get.to(() => TeacherDetailScreen(teacher: teacher));
//             },
//             child: Container(
//               width: 150.w,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Image
//                   ClipRRect(
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
//                     child: CachedNetworkImage(
//                       imageUrl: teacher.imageUrl,
//                       width: 150.w,
//                       height: 100.h,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                       errorWidget: (context, url, error) => const Icon(Icons.error),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           teacher.name,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyles.textView14SemiBold.copyWith(color: black),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           teacher.subject,
//                           style: TextStyles.hintStyle.copyWith(fontSize: 12.sp),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 4),
//                         Row(
//                           children: [
//                             Icon(Icons.star, size: 14.sp, color: Colors.amber),
//                             SizedBox(width: 4.w),
//                             Text(
//                               teacher.rating.toStringAsFixed(1),
//                               style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
class BestTeachersCard extends StatelessWidget {
  final List<TeacherModel> teachers;

  const BestTeachersCard({super.key, required this.teachers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h, // Increased height for better proportions
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: teachers.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w), // Increased spacing
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return _TeacherCard(teacher: teacher);
        },
      ),
    );
  }
}

class _TeacherCard extends StatefulWidget {
  final TeacherModel teacher;

  const _TeacherCard({required this.teacher});

  @override
  State<_TeacherCard> createState() => _TeacherCardState();
}

class _TeacherCardState extends State<_TeacherCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _onTap() {
    // Add haptic feedback
    HapticFeedback.lightImpact();
    // Navigate to detail screen
    // Get.to(() => TeacherDetailScreen(teacher: widget.teacher));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            onTap: _onTap,
            child: Container(
              width: 160.w, // Slightly wider for better proportions
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r), // Increased radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(_isPressed ? 0.1 : 0.08),
                    blurRadius: _isPressed ? 12 : 16,
                    offset: Offset(0, _isPressed ? 2 : 6),
                    spreadRadius: _isPressed ? 0 : 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Enhanced Image Section
                  _buildImageSection(),
                  // Enhanced Content Section
                  _buildContentSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          child: CachedNetworkImage(
            imageUrl: widget.teacher.imageUrl,
            width: 160.w,
            height: 110.h, // Adjusted height
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              width: 160.w,
              height: 110.h,
              color: Colors.grey[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: 160.w,
              height: 110.h,
              color: Colors.grey[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 32.sp,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'No Image',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Online status indicator (if available)
        if (widget.teacher.isOnline ?? false)
          Positioned(
            top: 8.h,
            right: 8.w,
            child: Container(
              width: 12.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContentSection() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Name and Subject
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.teacher.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A1A),
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  widget.teacher.subject,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

            // Rating and additional info
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 12.sp,
                            color: Colors.amber[700],
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            widget.teacher.rating.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.amber[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.teacher.studentCount != null) ...[
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          '${widget.teacher.studentCount} students',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[500],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Enhanced TeacherModel (add these properties if not already present)
extension TeacherModelExtension on TeacherModel {
  bool? get isOnline => null; // Add this to your model
  int? get studentCount => null; // Add this to your model
}

class TeacherModel {
  final String name;
  final String imageUrl;
  final String subject;
  final double rating;

  TeacherModel({
    required this.name,
    required this.imageUrl,
    required this.subject,
    required this.rating,
  });
}

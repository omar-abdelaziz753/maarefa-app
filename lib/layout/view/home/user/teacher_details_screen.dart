import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_academy/layout/view/home/user/data/models/get_all_teachers_data_model.dart';
import 'package:my_academy/layout/view/home/user/data/models/get_teacher_details_data_model.dart';
import 'package:my_academy/layout/view/home/user/view_all_specialization_screen.dart';

import '../../../../model/common/search/search_db_response.dart';
import 'data/cubit/home_cubit.dart';
import 'data/cubit/home_state.dart';

class TeacherDetailsScreen extends StatefulWidget {
  final String teacherId;

  const TeacherDetailsScreen({
    super.key,
    required this.teacherId,
  });

  @override
  State<TeacherDetailsScreen> createState() => _TeacherDetailsScreenState();
}

class _TeacherDetailsScreenState extends State<TeacherDetailsScreen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _appBarAnimationController;
  late AnimationController _bookingButtonController;
  bool _isAppBarExpanded = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _appBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _bookingButtonController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scrollController.addListener(_onScroll);

    // Fetch teacher details on init
    _fetchTeacherDetails();

    // Animate booking button entrance
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _bookingButtonController.forward();
      }
    });
  }

  void _fetchTeacherDetails() {
    final teacherId = int.tryParse(widget.teacherId);
    if (teacherId != null) {
      context.read<HomeCubit>().getTeacherDetails(providerId: teacherId);
    }
  }

  void _onScroll() {
    const offset = 200.0;
    if (_scrollController.offset > offset && _isAppBarExpanded) {
      setState(() => _isAppBarExpanded = false);
      _appBarAnimationController.forward();
    } else if (_scrollController.offset <= offset && !_isAppBarExpanded) {
      setState(() => _isAppBarExpanded = true);
      _appBarAnimationController.reverse();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _appBarAnimationController.dispose();
    _bookingButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetTeacherDetailsLoadingState) {
            return _buildLoadingScreen();
          } else if (state is GetTeacherDetailsErrorState) {
            return _buildErrorScreen(state.errorMessage);
          } else if (state is GetTeacherDetailsSuccessState) {
            final teacher = context.read<HomeCubit>().teacherDetailsDataModel?.data;
            if (teacher == null) {
              return _buildErrorScreen('teacher_data_not_available'.tr());
            }
            return _buildSuccessScreen(teacher);
          }
          return _buildLoadingScreen();
        },
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorScreen(String error) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.w,
              color: Colors.red[400],
            ),
            SizedBox(height: 16.h),
            Text(
              'something_went_wrong'.tr(),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              error,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: _fetchTeacherDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'retry'.tr(),
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessScreen(TeacherDetailsData teacher) {
    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildSliverAppBar(teacher),
            SliverToBoxAdapter(child: _buildTeacherInfo(teacher)),
            SliverToBoxAdapter(child: _buildStatsSection(teacher)),
            SliverToBoxAdapter(child: _buildAboutSection(teacher)),
            SliverToBoxAdapter(child: _buildLessonsSection(teacher)),
            SliverToBoxAdapter(child: _buildEducationSection(teacher)),
            SliverToBoxAdapter(child: SizedBox(height: 100.h)), // Space for booking button
          ],
        ),
        _buildBookingButton(teacher),
      ],
    );
  }

  Widget _buildSliverAppBar(TeacherDetailsData teacher) {
    final fullName = '${teacher.provider?.firstName ?? ''} ${teacher.provider?.lastName ?? ''}'.trim();

    return SliverAppBar(
      expandedHeight: 300.h,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      leading: Container(
        margin: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.w),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: IconButton(
            icon: Icon(Icons.description_outlined, color: Colors.white, size: 20.w),
            onPressed: () {
              HapticFeedback.lightImpact();
            },
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image/Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // Profile Image
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Hero(
                    tag: 'teacher_avatar_${teacher.provider?.id}',
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: teacher.provider?.imagePath != null && teacher.provider!.imagePath!.isNotEmpty
                            ? CachedNetworkImage(
                          imageUrl: teacher.provider!.imagePath!,
                          width: 120.w,
                          height: 120.h,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => _buildAvatarPlaceholder(),
                          errorWidget: (_, __, ___) => _buildDefaultAvatar(),
                        )
                            : _buildDefaultAvatar(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    fullName.isNotEmpty ? fullName : 'name_not_available'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (teacher.provider?.title != null) ...[
                    SizedBox(height: 8.h),
                    Text(
                      teacher.provider!.title!,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherInfo(TeacherDetailsData teacher) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue[600], size: 24.w),
              SizedBox(width: 12.w),
              Text(
                'teacher_info'.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          if (teacher.provider?.specializations != null) ...[
            _buildInfoRow(Icons.school_outlined, 'specialization'.tr(), teacher.provider!.specializations!.map((spec) => spec.name ?? '').where((name) => name.isNotEmpty).join(', ')),
            SizedBox(height: 12.h),
          ],

          if (teacher.provider?.degree != null) ...[
            _buildInfoRow(Icons.workspace_premium_outlined, 'qualification'.tr(), teacher.provider?.degree ?? 'no_qualification'.tr()),
            SizedBox(height: 12.h),
          ],

          if (teacher.provider?.phone != null) ...[
            _buildInfoRow(Icons.phone_outlined, 'phoneNumber'.tr(), teacher.provider?.phone ?? 'no_phone_number'.tr()),
            SizedBox(height: 12.h),
          ],

          if (teacher.provider?.email != null) ...[
            _buildInfoRow(Icons.email_outlined, 'emailAddress'.tr(), teacher.provider?.email ?? 'no_email'.tr()),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey[600], size: 20.w),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(TeacherDetailsData teacher) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(child: _buildStatCard('ratee'.tr(), teacher.provider?.rate?.toStringAsFixed(1) ?? '0.0', Icons.star, Colors.amber)),
          SizedBox(width: 12.w),
          Expanded(child: _buildStatCard('students'.tr(), '${teacher.provider?.rateCount ?? 0}', Icons.people, Colors.blue)),
          SizedBox(width: 12.w),
          Expanded(child: _buildStatCard('coursess'.tr(), '${teacher.lessons?.length ?? 0}', Icons.play_lesson, Colors.green)),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24.w),
          ),
          SizedBox(height: 12.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(TeacherDetailsData teacher) {
    final aboutText = teacher.provider?.bio?.isNotEmpty == true
        ? teacher.provider?.bio!
        : '${teacher.provider?.title ?? "teacher".tr()} ${'specialized_in'.tr()} ${teacher.provider?.specializations ?? teacher.provider?.degree ?? "education".tr()}';

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_outline, color: Colors.blue[600], size: 24.w),
              SizedBox(width: 12.w),
              Text(
                'aboutOfTeacher'.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            aboutText ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  String _formatLessonTime(String? timeString) {
    if (timeString == null || timeString.isEmpty) return '';

    try {
      final dateTime = DateTime.parse(timeString);
      final now = DateTime.now();
      final difference = dateTime.difference(now);

      if (difference.inDays > 0) {
        return '${'during'.tr()} ${difference.inDays} ${'dayss'.tr()}';
      } else if (difference.inHours > 0) {
        return '${'during'.tr()} ${difference.inHours} ${'hourss'.tr()}';
      } else if (difference.inMinutes > 0) {
        return '${'during'.tr()} ${difference.inMinutes} ${'minutess'.tr()}';
      } else {
        return 'now'.tr();
      }
    } catch (e) {
      return timeString;
    }
  }

  Widget _buildLessonCard(Lesson lesson) {
    final nextTime = _formatLessonTime(lesson.nextTime);
    final priceText = lesson.hourPrice != null ? '${lesson.hourPrice} ر.س/ساعة' : 'السعر غير محدد';

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (lesson.subject?.name != null)
                      Text(
                        lesson.subject!.name!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                    if (lesson.content != null && lesson.content!.isNotEmpty) ...[
                      SizedBox(height: 4.h),
                      Text(
                        lesson.content!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: lesson.isLive == true ? Colors.red[50] : Colors.green[50],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      lesson.isLive == true ? 'livee'.tr() : 'registered'.tr(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: lesson.isLive == true ? Colors.red[600] : Colors.green[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (lesson.rate != null && lesson.rate! > 0) ...[
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 12.w),
                        SizedBox(width: 2.w),
                        Text(
                          '${lesson.rate}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              if (lesson.educationalStage?.name != null) ...[
                Icon(Icons.school, color: Colors.blue[600], size: 14.w),
                SizedBox(width: 4.w),
                Text(
                  lesson.educationalStage!.name!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 12.w),
              ],
              if (nextTime.isNotEmpty) ...[
                Icon(Icons.access_time, color: Colors.orange[600], size: 14.w),
                SizedBox(width: 4.w),
                Text(
                  nextTime,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
              const Spacer(),
              Text(
                priceText,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.green[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          if (lesson.subscriptions != null && lesson.subscriptions! > 0) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.people, color: Colors.grey[500], size: 14.w),
                SizedBox(width: 4.w),
                Text(
                  '${lesson.subscriptions} ${'subscriptionss'.tr()}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }


  Widget _buildLessonsSection(TeacherDetailsData teacher) {
    if (teacher.lessons == null || teacher.lessons!.isEmpty) {
      return Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.play_lesson, color: Colors.blue[600], size: 24.w),
                SizedBox(width: 12.w),
                Text(
                  'lessons'.tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.school_outlined,
                    size: 48.w,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'no_lessonsً'.tr(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.play_lesson, color: Colors.blue[600], size: 24.w),
              SizedBox(width: 12.w),
              Text(
                'available_lessons'.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '${teacher.lessons!.length} ${'lessonWW'.tr()}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.blue[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Show first 3 lessons initially
          ...teacher.lessons!.take(3).map((lesson) => _buildLessonCard(lesson)).toList(),

          // Show all lessons button if there are more than 3
          if (teacher.lessons!.length > 3) ...[
            SizedBox(height: 12.h),
            Center(
              child: TextButton(
                onPressed: () => _showAllLessons(teacher.lessons!),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue[600],
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${'view_all_lessons'.tr()} (${teacher.lessons!.length})',
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.arrow_forward_ios, size: 14.w),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAllLessons(List<Lesson> lessons) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildAllLessonsBottomSheet(lessons),
    );
  }

  Widget _buildAllLessonsBottomSheet(List<Lesson> lessons) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Text(
                  'all_lessons'.tr(),
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '${lessons.length} ${'lessonWW'.tr()}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.blue[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return _buildLessonCard(lessons[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection(TeacherDetailsData teacher) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.school_outlined, color: Colors.blue[600], size: 24.w),
              SizedBox(width: 12.w),
              Text(
                'educationAndExperience'.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          if (teacher.provider?.degree != null)
            _buildEducationItem(
              teacher.provider?.degree ?? '',
              // teacher.provider?.specializations! .join(', ') ?? '',
              teacher.provider?.specializations?.map((spec) => spec.name ?? '').where((name) => name.isNotEmpty).join(', ') ?? '',
              // !.map((spec) => spec.name ?? '').where((name) => name.isNotEmpty).join(', '))
              '',
            ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String institution, String degree, String period) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: Colors.blue[600],
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                institution,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              if (degree.isNotEmpty) ...[
                SizedBox(height: 4.h),
                Text(
                  degree,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookingButton(TeacherDetailsData teacher) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _bookingButtonController,
          curve: Curves.easeOutCubic,
        )),
        child: Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 32.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _onBookNowPressed(teacher),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today, size: 20.w),
                      SizedBox(width: 8.w),
                      Text(
                        'bookNow'.tr(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarPlaceholder() {
    return Container(
      width: 120.w,
      height: 120.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white24,
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      width: 120.w,
      height: 120.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white24,
      ),
      child: Icon(
        Icons.person_outline,
        size: 60.w,
        color: Colors.white,
      ),
    );
  }

  void _onBookNowPressed(TeacherDetailsData teacher) {
    HapticFeedback.mediumImpact();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildBookingBottomSheet(teacher),
    );
  }

  Widget _buildBookingBottomSheet(TeacherDetailsData teacher) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${'book'.tr()} ${teacher.provider?.firstName ?? "المدرس"}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'chooseDateAndTime'.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 24.h),

                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      'bookingsCalendar'.tr(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showBookingConfirmation(teacher);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'confirmBooking'.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingConfirmation(TeacherDetailsData teacher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green[600], size: 28.w),
            SizedBox(width: 12.w),
            Text('bookingSuccess'.tr(), style: TextStyle(color: Colors.green[600])),
          ],
        ),
        content: Text('${'bookLesson'.tr()} ${teacher.provider?.firstName ?? "المدرس"} بنجاح. سيتم التواصل معك قريباً.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ok'.tr(), style: TextStyle(color: Colors.green[600])),
          ),
        ],
      ),
    );
  }
}













// class TeacherDetailsScreen extends StatefulWidget {
//   final String teacherId;
//
//   const TeacherDetailsScreen({
//     super.key,
//     required this.teacherId,
//   });
//
//   @override
//   State<TeacherDetailsScreen> createState() => _TeacherDetailsScreenState();
// }
//
// class _TeacherDetailsScreenState extends State<TeacherDetailsScreen>
//     with TickerProviderStateMixin {
//   late ScrollController _scrollController;
//   late AnimationController _appBarAnimationController;
//   late AnimationController _bookingButtonController;
//   bool _isAppBarExpanded = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _appBarAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );
//     _bookingButtonController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//
//     _scrollController.addListener(_onScroll);
//
//     // Animate booking button entrance
//     Future.delayed(const Duration(milliseconds: 500), () {
//       _bookingButtonController.forward();
//     });
//   }
//
//   void _onScroll() {
//     const offset = 200.0;
//     if (_scrollController.offset > offset && _isAppBarExpanded) {
//       setState(() => _isAppBarExpanded = false);
//       _appBarAnimationController.forward();
//     } else if (_scrollController.offset <= offset && !_isAppBarExpanded) {
//       setState(() => _isAppBarExpanded = true);
//       _appBarAnimationController.reverse();
//     }
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _appBarAnimationController.dispose();
//     _bookingButtonController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: Stack(
//         children: [
//           CustomScrollView(
//             controller: _scrollController,
//             physics: const BouncingScrollPhysics(),
//             slivers: [
//               _buildSliverAppBar(),
//               SliverToBoxAdapter(child: _buildTeacherInfo()),
//               SliverToBoxAdapter(child: _buildStatsSection()),
//               SliverToBoxAdapter(child: _buildAboutSection()),
//               SliverToBoxAdapter(child: _buildEducationSection()),
//               // SliverToBoxAdapter(child: _buildReviewsSection()),
//               SliverToBoxAdapter(child: SizedBox(height: 100.h)), // Space for booking button
//             ],
//           ),
//           _buildBookingButton(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSliverAppBar() {
//     final fullName = '${widget.teacher.firstName ?? ''} ${widget.teacher.lastName ?? ''}'.trim();
//
//     return SliverAppBar(
//       expandedHeight: 300.h,
//       floating: false,
//       pinned: true,
//       elevation: 0,
//       backgroundColor: Colors.white,
//       surfaceTintColor: Colors.transparent,
//       leading: Container(
//         margin: EdgeInsets.all(8.w),
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.3),
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.w),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       actions: [
//         Container(
//           margin: EdgeInsets.all(8.w),
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.3),
//             borderRadius: BorderRadius.circular(12.r),
//           ),
//           child: IconButton(
//             icon: Icon(Icons.description_outlined, color: Colors.white, size: 20.w),
//             onPressed: () {
//               // Handle favorite action
//               HapticFeedback.lightImpact();
//             },
//           ),
//         ),
//       ],
//       flexibleSpace: FlexibleSpaceBar(
//         background: Stack(
//           fit: StackFit.expand,
//           children: [
//             // Background Image/Gradient
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF667eea), Color(0xFF764ba2)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//
//             // Profile Image
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 40.h),
//                   Hero(
//                     tag: 'teacher_avatar_${widget.teacher.id}',
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.white, width: 4.w),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 20,
//                             offset: const Offset(0, 8),
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: widget.teacher.imagePath != null && widget.teacher.imagePath!.isNotEmpty
//                             ? CachedNetworkImage(
//                           imageUrl: widget.teacher.imagePath!,
//                           width: 120.w,
//                           height: 120.h,
//                           fit: BoxFit.cover,
//                           placeholder: (_, __) => _buildAvatarPlaceholder(),
//                           errorWidget: (_, __, ___) => _buildDefaultAvatar(),
//                         )
//                             : _buildDefaultAvatar(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//                   Text(
//                     fullName.isNotEmpty ? fullName : 'اسم غير متوفر',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24.sp,
//                       fontWeight: FontWeight.bold,
//                       shadows: [
//                         Shadow(
//                           color: Colors.black.withOpacity(0.5),
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   if (widget.teacher.title != null) ...[
//                     SizedBox(height: 8.h),
//                     Text(
//                       widget.teacher.title!,
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.9),
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         shadows: [
//                           Shadow(
//                             color: Colors.black.withOpacity(0.5),
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTeacherInfo() {
//     return Container(
//       margin: EdgeInsets.all(16.w),
//       padding: EdgeInsets.all(20.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.info_outline, color: Colors.blue[600], size: 24.w),
//               SizedBox(width: 12.w),
//               Text(
//                 'معلومات المدرس',
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16.h),
//
//           if (widget.teacher.degree != null) ...[
//             _buildInfoRow(Icons.school_outlined, 'التخصص', widget.teacher.degree!),
//             SizedBox(height: 12.h),
//           ],
//
//           if (widget.teacher.degree != null) ...[
//             _buildInfoRow(Icons.workspace_premium_outlined, 'المؤهل', widget.teacher.degree!),
//             SizedBox(height: 12.h),
//           ],
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(IconData icon, String label, String value) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, color: Colors.grey[600], size: 20.w),
//         SizedBox(width: 12.w),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: Colors.grey[600],
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 2.h),
//               Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   color: Colors.grey[800],
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildStatsSection() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Row(
//         children: [
//           Expanded(child: _buildStatCard('تقييم', widget.teacher.rate?.toStringAsFixed(1) ?? '0.0', Icons.star, Colors.amber)),
//           SizedBox(width: 12.w),
//           Expanded(child: _buildStatCard('طلاب', '${widget.teacher.rateCount ?? 0}', Icons.people, Colors.blue)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatCard(String title, String value, IconData icon, Color color) {
//     return Container(
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(12.w),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, color: color, size: 24.w),
//           ),
//           SizedBox(height: 12.h),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 20.sp,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[800],
//             ),
//           ),
//           SizedBox(height: 4.h),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12.sp,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAboutSection() {
//     return Container(
//       margin: EdgeInsets.all(16.w),
//       padding: EdgeInsets.all(20.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.person_outline, color: Colors.blue[600], size: 24.w),
//               SizedBox(width: 12.w),
//               Text(
//                 'نبذة عن المدرس',
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16.h),
//           Text(
//             '${widget.teacher.title!} مدرس متخصص ومتمرس في ${widget.teacher.degree!}',
//             // widget.teacher.title?? 'مدرس متخصص ومتمرس في مجال ${widget.teacher.degree ?? 'التعليم'} مع خبرة واسعة في تدريس الطلاب من مختلف المستويات. أسعى دائماً لتقديم تجربة تعليمية مميزة وفعالة تساعد الطلاب على تحقيق أهدافهم الأكاديمية.',
//             style: TextStyle(
//               fontSize: 16.sp,
//               color: Colors.grey[700],
//               height: 1.6,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEducationSection() {
//     return Container(
//       margin: EdgeInsets.all(16.w),
//       padding: EdgeInsets.all(20.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.school_outlined, color: Colors.blue[600], size: 24.w),
//               SizedBox(width: 12.w),
//               Text(
//                 'التعليم والخبرة',
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey[800],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16.h),
//
//           _buildEducationItem(
//             widget.teacher.degree ?? 'بكالوريوس في التربية',
//            '',
//             '2018 - 2022',
//           ),
//           SizedBox(height: 16.h),
//           // _buildEducationItem(
//           //   'خبرة تدريسية',
//           //   'مدرس ${widget.teacher.speciality ?? 'متخصص'}',
//           //   '2022 - الآن',
//           // ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEducationItem(String institution, String degree, String period) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 12.w,
//           height: 12.h,
//           decoration: BoxDecoration(
//             color: Colors.blue[600],
//             shape: BoxShape.circle,
//           ),
//         ),
//         SizedBox(width: 16.w),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 institution,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey[800],
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildReviewsSection() {
//     return Container(
//       margin: EdgeInsets.all(16.w),
//       padding: EdgeInsets.all(20.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.star_outline, color: Colors.blue[600], size: 24.w),
//                   SizedBox(width: 12.w),
//                   Text(
//                     'التقييمات',
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                 ],
//               ),
//               // TextButton(
//               //   onPressed: () {
//               //     // Navigate to all reviews
//               //   },
//               //   child: Text('عرض الكل'),
//               // ),
//             ],
//           ),
//           SizedBox(height: 16.h),
//
//           // Sample reviews
//           _buildReviewItem('أحمد محمد', 'مدرس ممتاز ويشرح بطريقة واضحة ومفهومة', 5),
//           SizedBox(height: 16.h),
//           _buildReviewItem('فاطمة علي', 'استفدت كثيراً من دروسه وأسلوبه في التدريس رائع', 4),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildReviewItem(String name, String review, int rating) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             CircleAvatar(
//               radius: 20.r,
//               backgroundColor: Colors.grey[300],
//               child: Icon(Icons.person, color: Colors.grey[600]),
//             ),
//             SizedBox(width: 12.w),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                   Row(
//                     children: List.generate(5, (index) {
//                       return Icon(
//                         index < rating ? Icons.star : Icons.star_outline,
//                         size: 16.w,
//                         color: Colors.amber[600],
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           review,
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Colors.grey[600],
//             height: 1.4,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBookingButton() {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(0, 1),
//           end: Offset.zero,
//         ).animate(CurvedAnimation(
//           parent: _bookingButtonController,
//           curve: Curves.easeOutCubic,
//         )),
//         child: Container(
//           padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 32.h),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(24.r),
//               topRight: Radius.circular(24.r),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 20,
//                 offset: const Offset(0, -4),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: _onBookNowPressed,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue[600],
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(vertical: 16.h),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16.r),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.calendar_today, size: 20.w),
//                       SizedBox(width: 8.w),
//                       Text(
//                         'احجز الآن',
//                         style: TextStyle(
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // SizedBox(width: 16.w),
//               // Container(
//               //   decoration: BoxDecoration(
//               //     border: Border.all(color: Colors.grey[300]!),
//               //     borderRadius: BorderRadius.circular(16.r),
//               //   ),
//               //   child: IconButton(
//               //     onPressed: () {
//               //       // Handle chat action
//               //       HapticFeedback.lightImpact();
//               //     },
//               //     icon: Icon(Icons.chat_bubble_outline, color: Colors.grey[700]),
//               //     padding: EdgeInsets.all(16.w),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAvatarPlaceholder() {
//     return Container(
//       width: 120.w,
//       height: 120.h,
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white24,
//       ),
//       child: const Center(
//         child: CircularProgressIndicator(
//           color: Colors.white,
//           strokeWidth: 2,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDefaultAvatar() {
//     return Container(
//       width: 120.w,
//       height: 120.h,
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white24,
//       ),
//       child: Icon(
//         Icons.person_outline,
//         size: 60.w,
//         color: Colors.white,
//       ),
//     );
//   }
//
//   void _onBookNowPressed() {
//     HapticFeedback.mediumImpact();
//
//     // Show booking bottom sheet or navigate to booking screen
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => _buildBookingBottomSheet(),
//     );
//   }
//
//   Widget _buildBookingBottomSheet() {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.7,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.r),
//           topRight: Radius.circular(24.r),
//         ),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 40.w,
//             height: 4.h,
//             margin: EdgeInsets.only(top: 12.h),
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(2.r),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(24.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'احجز درس مع ${widget.teacher.firstName}',
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 Text(
//                   'اختر التاريخ والوقت المناسب لك',
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 SizedBox(height: 24.h),
//
//                 // Calendar or time slots would go here
//                 Container(
//                   padding: EdgeInsets.all(16.w),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[50],
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'تقويم الحجز سيتم إضافته هنا',
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 24.h),
//
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       // Handle booking confirmation
//                       _showBookingConfirmation();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue[600],
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(vertical: 16.h),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.r),
//                       ),
//                     ),
//                     child: Text(
//                       'تأكيد الحجز',
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showBookingConfirmation() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         title: Row(
//           children: [
//             Icon(Icons.check_circle, color: Colors.green[600], size: 28.w),
//             SizedBox(width: 12.w),
//             Text('تم الحجز بنجاح'),
//           ],
//         ),
//         content: Text('تم حجز درسك مع ${widget.teacher.firstName} بنجاح. سيتم التواصل معك قريباً.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('حسناً'),
//           ),
//         ],
//       ),
//     );
//   }
// }
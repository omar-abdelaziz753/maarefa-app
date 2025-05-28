// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../layout/activity/user_screens/search/search.dart';
// import '../../res/drawable/icon/icons.dart';
// import '../../res/value/color/color.dart';
// import '../../res/value/style/textstyles.dart';
// import '../side_padding/side_padding.dart';
//
// class SearchHomeWidget extends StatelessWidget {
//   const SearchHomeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.to(() => const SearchScreen()),
//       child: SidePadding(
//         sidePadding: 35.w,
//         child: LimitedBox(
//           maxHeight: 55.h,
//           child: Container(
//             decoration: BoxDecoration(
//                 color: white,
//                 borderRadius: BorderRadius.circular(10.r),
//                 boxShadow: const [BoxShadow()]),
//             child: Row(
//               children: [
//                 const SizedBox(width: 10),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 15.h),
//                   child: Image.asset(search, height: 20.h, fit: BoxFit.contain),
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   tr("search_courses"),
//                   style: TextStyles.hintStyle,
//                 ),
//                 const Spacer(),
//                 Container(
//                   height: 55.h,
//                   width: 55.w,
//                   decoration: const BoxDecoration(
//                       color: accentColor,
//                       borderRadius: BorderRadiusDirectional.only(
//                           topEnd: Radius.circular(12),
//                           bottomEnd: Radius.circular(12))),
//                   child: Center(
//                       child: Image.asset(filter,
//                           color: mainColor, height: 20.h, fit: BoxFit.contain)),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../layout/activity/user_screens/search/search.dart';
import '../../res/drawable/icon/icons.dart';
import '../../res/value/color/color.dart';
import '../../res/value/style/textstyles.dart';
import '../side_padding/side_padding.dart';

class SearchHomeWidget extends StatefulWidget {
  const SearchHomeWidget({super.key});

  @override
  State<SearchHomeWidget> createState() => _SearchHomeWidgetState();
}

class _SearchHomeWidgetState extends State<SearchHomeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
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

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _navigateToSearch() {
    // Add haptic feedback for better UX
    // HapticFeedback.lightImpact(); // Uncomment if you want haptic feedback
    Get.to(
          () => const SearchScreen(),
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SidePadding(
      sidePadding: 18.w,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GestureDetector(
              onTapDown: _handleTapDown,
              onTapUp: _handleTapUp,
              onTapCancel: _handleTapCancel,
              onTap: _navigateToSearch,
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(_isPressed ? 0.05 : 0.08),
                      blurRadius: _isPressed ? 8 : 12,
                      offset: Offset(0, _isPressed ? 2 : 4),
                      spreadRadius: 0,
                    ),
                    // Inner shadow for depth
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                      spreadRadius: 0,
                    ),
                  ],
                  border: Border.all(
                    color: _isPressed
                        ? accentColor.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16.w),
                    // Search Icon with subtle animation
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 200),
                      tween: Tween(begin: 0.0, end: _isPressed ? 1.0 : 0.0),
                      builder: (context, value, child) {
                        return Transform.rotate(
                          angle: value * 0.1,
                          // child: Image.asset(
                          //   search,
                          //   height: 20.h,
                          //   width: 20.w,
                          //   fit: BoxFit.contain,
                          //   color: Colors.grey[600],
                          // ),
                          child: SvgPicture.asset(
                            'assets/images/search_icon.svg'
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 12.w),
                    // Search Text
                    Expanded(
                      child: Text(
                        tr("search_courses"),
                        style: TextStyles.hintStyle?.copyWith(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.2,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    // Filter Button with enhanced styling
                    Container(
                      height: 55.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            accentColor.withOpacity(0.9),
                            accentColor.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.r),
                          bottomRight: Radius.circular(12.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                          ),
                          onTap: () {
                            // Handle filter action separately if needed
                            _navigateToSearch();
                          },
                          child: Center(
                            child: TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 300),
                              tween: Tween(begin: 0.0, end: _isPressed ? 1.0 : 0.0),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: 1.0 + (value * 0.1),
                                  child: Image.asset(
                                    filter,
                                    color: mainColor,
                                    height: 20.h,
                                    width: 20.w,
                                    fit: BoxFit.contain,
                                  ),
                                );
                              },
                            ),
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
    );
  }
}
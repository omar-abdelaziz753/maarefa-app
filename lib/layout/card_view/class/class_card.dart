import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/user_screens/class/class_screen.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';

// class ClassCard extends StatefulWidget {
//   const ClassCard({
//     super.key,
//     required this.name,
//     required this.id,
//     required this.stageId,
//     this.studentCount,
//     this.isActive = true,
//     this.icon,
//   });
//
//   final String name;
//   final int id;
//   final int stageId;
//   final int? studentCount;
//   final bool isActive;
//   final IconData? icon;
//
//   @override
//   State<ClassCard> createState() => _ClassCardState();
// }
//
// class _ClassCardState extends State<ClassCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;
//   bool _isPressed = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );
//
//     _scaleAnimation = Tween<double>(
//       begin: 1.0,
//       end: 0.95,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));
//
//     _opacityAnimation = Tween<double>(
//       begin: 0.1,
//       end: 0.2,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _handleTapDown(TapDownDetails details) {
//     if (!widget.isActive) return;
//     setState(() => _isPressed = true);
//     _animationController.forward();
//   }
//
//   void _handleTapUp(TapUpDetails details) {
//     if (!widget.isActive) return;
//     setState(() => _isPressed = false);
//     _animationController.reverse();
//   }
//
//   void _handleTapCancel() {
//     if (!widget.isActive) return;
//     setState(() => _isPressed = false);
//     _animationController.reverse();
//   }
//
//   void _navigateToClass() {
//     if (!widget.isActive) return;
//
//     // Add haptic feedback
//     HapticFeedback.lightImpact();
//
//     Get.to(
//           () => ClassScreen(
//         id: widget.id,
//         stageId: widget.stageId,
//         name: widget.name,
//       ),
//       transition: Transition.fadeIn,
//       duration: const Duration(milliseconds: 300),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animationController,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: _scaleAnimation.value,
//           child: GestureDetector(
//             onTap: _navigateToClass,
//             onTapDown: _handleTapDown,
//             onTapUp: _handleTapUp,
//             onTapCancel: _handleTapCancel,
//             child: Container(
//               height: 100.h,
//               width: (screenWidth - 80.w) / 2,
//               margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: widget.isActive
//                         ? mainColor.withOpacity(0.15)
//                         : Colors.grey.withOpacity(0.1),
//                     blurRadius: 12.r,
//                     offset: Offset(0, 4.h),
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: Material(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(16.r),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 200),
//                   decoration: BoxDecoration(
//                     color: widget.isActive
//                         ? mainColor.withOpacity(_opacityAnimation.value)
//                         : Colors.grey.withOpacity(0.05),
//                     borderRadius: BorderRadius.circular(16.r),
//                   ),
//                   child: widget.isActive
//                       ? _buildActiveCard()
//                       : _buildInactiveCard(),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildActiveCard() {
//     return DottedBorder(
//       borderType: BorderType.RRect,
//       color: mainColor,
//       strokeWidth: 2.w,
//       dashPattern: [8, 4],
//       radius: Radius.circular(16.r),
//       padding: EdgeInsets.all(12.w),
//       child: Container(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Icon section
//             Container(
//               padding: EdgeInsets.all(8.w),
//               decoration: BoxDecoration(
//                 color: mainColor.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 widget.icon ?? Icons.class_outlined,
//                 color: mainColor,
//                 size: 20.sp,
//               ),
//             ),
//
//             SizedBox(height: 8.h),
//
//             // Class name
//             Text(
//               widget.name,
//               style: TextStyles.subTitleStyle.copyWith(
//                 color: mainColor,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 13.sp,
//               ),
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//
//             // Student count (if provided)
//             if (widget.studentCount != null) ...[
//               SizedBox(height: 4.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.people_outline,
//                     size: 12.sp,
//                     color: mainColor.withOpacity(0.7),
//                   ),
//                   SizedBox(width: 4.w),
//                   Text(
//                     '${widget.studentCount} students',
//                     style: TextStyle(
//                       fontSize: 10.sp,
//                       color: mainColor.withOpacity(0.7),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInactiveCard() {
//     return Container(
//       padding: EdgeInsets.all(12.w),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.grey.withOpacity(0.3),
//           width: 1.w,
//         ),
//         borderRadius: BorderRadius.circular(16.r),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Inactive icon
//           Container(
//             padding: EdgeInsets.all(8.w),
//             decoration: BoxDecoration(
//               color: Colors.grey.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.lock_outline,
//               color: Colors.grey,
//               size: 20.sp,
//             ),
//           ),
//
//           SizedBox(height: 8.h),
//
//           // Class name (grayed out)
//           Text(
//             widget.name,
//             style: TextStyles.subTitleStyle.copyWith(
//               color: Colors.grey,
//               fontWeight: FontWeight.w500,
//               fontSize: 13.sp,
//             ),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//
//           SizedBox(height: 4.h),
//
//           // Inactive label
//           Text(
//             'Coming Soon',
//             style: TextStyle(
//               fontSize: 10.sp,
//               color: Colors.grey.withOpacity(0.7),
//               fontWeight: FontWeight.w400,
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ClassCard extends StatefulWidget {
  const ClassCard({
    super.key,
    required this.name,
    required this.id,
    required this.stageId,
    this.studentCount,
    this.isActive = true,
    this.icon,
  });

  final String name;
  final int id;
  final int stageId;
  final int? studentCount;
  final bool isActive;
  final IconData? icon;

  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.1,
      end: 0.2,
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
    if (!widget.isActive) return;
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.isActive) return;
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _handleTapCancel() {
    if (!widget.isActive) return;
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _navigateToClass() {
    if (!widget.isActive) return;

    // Add haptic feedback
    HapticFeedback.lightImpact();

    Get.to(
          () => ClassScreen(
        id: widget.id,
        stageId: widget.stageId,
        name: widget.name,
      ),
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTap: _navigateToClass,
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            child: Container(
              height: 120.h, // Increased height to prevent overflow
              width: (screenWidth - 80.w) / 2,
              margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: widget.isActive
                        ? mainColor.withOpacity(0.15)
                        : Colors.grey.withOpacity(0.1),
                    blurRadius: 12.r,
                    offset: Offset(0, 4.h),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16.r),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: widget.isActive
                        ? mainColor.withOpacity(_opacityAnimation.value)
                        : Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: widget.isActive
                      ? _buildActiveCard()
                      : _buildInactiveCard(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActiveCard() {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: mainColor,
      strokeWidth: 2.w,
      dashPattern: [8, 4],
      radius: Radius.circular(16.r),
      padding: EdgeInsets.all(8.w), // Reduced padding
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Important: prevents overflow
          children: [
            // Icon section
            Container(
              padding: EdgeInsets.all(6.w), // Reduced padding
              decoration: BoxDecoration(
                color: mainColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon ?? Icons.class_outlined,
                color: mainColor,
                size: 18.sp, // Slightly smaller icon
              ),
            ),

            SizedBox(height: 6.h), // Reduced spacing

            // Class name
            Flexible( // Added Flexible to prevent overflow
              child: Text(
                widget.name,
                style: TextStyles.subTitleStyle.copyWith(
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp, // Slightly smaller font
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Student count (if provided)
            if (widget.studentCount != null) ...[
              SizedBox(height: 3.h), // Reduced spacing
              Flexible( // Added Flexible
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 11.sp, // Smaller icon
                      color: mainColor.withOpacity(0.7),
                    ),
                    SizedBox(width: 3.w),
                    Flexible(
                      child: Text(
                        '${widget.studentCount} students',
                        style: TextStyle(
                          fontSize: 9.sp, // Smaller font
                          color: mainColor.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInactiveCard() {
    return Container(
      padding: EdgeInsets.all(8.w), // Reduced padding
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Important: prevents overflow
        children: [
          // Inactive icon
          Container(
            padding: EdgeInsets.all(6.w), // Reduced padding
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lock_outline,
              color: Colors.grey,
              size: 18.sp, // Slightly smaller icon
            ),
          ),

          SizedBox(height: 6.h), // Reduced spacing

          // Class name (grayed out)
          Flexible( // Added Flexible to prevent overflow
            child: Text(
              widget.name,
              style: TextStyles.subTitleStyle.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp, // Slightly smaller font
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: 3.h), // Reduced spacing

          // Inactive label
          Text(
            'Coming Soon',
            style: TextStyle(
              fontSize: 9.sp, // Smaller font
              color: Colors.grey.withOpacity(0.7),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:my_academy/layout/activity/user_screens/class/class_screen.dart';
//
// import '../../../res/value/color/color.dart';
// import '../../../res/value/dimenssion/dimenssions.dart';
// import '../../../res/value/style/textstyles.dart';
//
// class ClassCard extends StatelessWidget {
//   const ClassCard({
//     super.key,
//     required this.name,
//     required this.id,
//     required this.stageId,
//   });
//   final String name;
//   final int id;
//   final int stageId;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () =>
//           Get.to(() => ClassScreen(id: id, stageId: stageId, name: name)),
//       child: Card(
//         semanticContainer: true,
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5.r),
//         ),
//         child: Container(
//           height: 75.h,
//           width: (screenWidth - 80.w) / 2,
//           color: mainColor.withOpacity(0.1),
//           child: DottedBorder(
//             borderType: BorderType.RRect,
//             color: mainColor,
//             radius: Radius.circular(5.r),
//             child: Center(
//                 child: Text(
//               name,
//               style: TextStyles.subTitleStyle,
//             )),
//           ),
//         ),
//       ),
//     );
//   }
// }
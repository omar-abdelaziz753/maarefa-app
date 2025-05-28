import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/buttons/master/master_button.dart';
import '../../../widget/side_padding/side_padding.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RightHomeCard extends StatefulWidget {
  final String title, subTitle, buttonText, image;
  final VoidCallback? onTap;
  final Color? primaryColor;
  final Color? secondaryColor;

  const RightHomeCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.image,
    required this.subTitle,
    this.onTap,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  State<RightHomeCard> createState() => _RightHomeCardState();
}

class _RightHomeCardState extends State<RightHomeCard>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _slideController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _isHovered = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    ));

    // Start entrance animation with slight delay for staggered effect
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _slideController.forward();
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _scaleController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _scaleController.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _scaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale!.languageCode == "ar";
    final primaryColor = widget.primaryColor ?? mainLightColor;
    final secondaryColor = widget.secondaryColor ?? cvColor;

    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _slideAnimation, _fadeAnimation]),
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 8.h,
                ),
                child: GestureDetector(
                  onTapDown: _handleTapDown,
                  onTapUp: _handleTapUp,
                  onTapCancel: _handleTapCancel,
                  onTap: widget.onTap,
                  child: MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                      // height: 200.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: isRTL ? Alignment.centerLeft : Alignment.centerRight,
                          end: isRTL ? Alignment.centerRight : Alignment.centerLeft,
                          colors: [
                            primaryColor,
                            primaryColor.withOpacity(0.85),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            blurRadius: _isPressed ? 8 : _isHovered ? 20 : 15,
                            offset: Offset(0, _isPressed ? 2 : _isHovered ? 8 : 5),
                            spreadRadius: _isPressed ? -2 : 0,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Stack(
                          children: [
                            // Background Pattern/Decoration
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    center: isRTL ? Alignment.centerRight : Alignment.centerLeft,
                                    radius: 1.2,
                                    colors: [
                                      Colors.white.withOpacity(0.1),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Main Content
                            Padding(
                              padding: EdgeInsets.all(24.w),
                              child: Row(
                                children: [
                                  // Content Section (Left side)
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: isRTL ? 0 : 20.w,
                                        left: isRTL ? 20.w : 0,
                                      ),
                                      child: _buildContentSection(secondaryColor),
                                    ),
                                  ),

                                  // Image Section (Right side for LTR, Left for RTL)
                                  _buildImageSection(),
                                ],
                              ),
                            ),

                            // Shimmer Effect on Hover
                            if (_isHovered)
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    gradient: LinearGradient(
                                      begin: const Alignment(-1.0, 0.0),
                                      end: const Alignment(1.0, 0.0),
                                      colors: [
                                        Colors.transparent,
                                        Colors.white.withOpacity(0.1),
                                        Colors.transparent,
                                      ],
                                      stops: const [0.0, 0.5, 1.0],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: _isHovered ? 1.0 : 0.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 1.0 + (value * 0.05),
          child: Container(
            width: 120.w,
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 40.sp,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContentSection(Color secondaryColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Section
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, (1 - value) * 20),
              child: Opacity(
                opacity: value,
                child: Text(
                  widget.title,
                  style: TextStyles.titleStyle?.copyWith(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),

        SizedBox(height: 8.h),

        // Subtitle Section
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, (1 - value) * 15),
              child: Opacity(
                opacity: value,
                child: Text(
                  widget.subTitle,
                  style: TextStyles.hintStyle?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),

        SizedBox(height: 16.h),

        // Button Section
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 700),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, (1 - value) * 10),
              child: Opacity(
                opacity: value,
                child: _buildActionButton(secondaryColor),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionButton(Color secondaryColor) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: secondaryColor,
          elevation: _isHovered ? 8 : 4,
          shadowColor: Colors.black.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 12.h,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.buttonText,
              style: TextStyles.errorStyle?.copyWith(
                color: secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(width: 8.w),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 300),
              tween: Tween(begin: 0.0, end: _isHovered ? 1.0 : 0.0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 4, 0),
                  child: Icon(
                    Get.locale!.languageCode == "ar"
                        ? Icons.arrow_forward_ios
                        : Icons.arrow_forward_ios_rounded,
                    size: 16.sp,
                    color: secondaryColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LeftHomeCard extends StatefulWidget {
  final String title, subTitle, buttonText, image;
  final VoidCallback? onTap;
  final Color? primaryColor;
  final Color? secondaryColor;

  const LeftHomeCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.image,
    required this.subTitle,
    this.onTap,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  State<LeftHomeCard> createState() => _LeftHomeCardState();
}

class _LeftHomeCardState extends State<LeftHomeCard>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _slideController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _isHovered = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    ));

    // Start entrance animation
    _slideController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _scaleController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _scaleController.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _scaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale!.languageCode == "ar";
    final primaryColor = widget.primaryColor ?? mainLightColor;
    final secondaryColor = widget.secondaryColor ?? cvColor;

    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _slideAnimation, _fadeAnimation]),
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 8.h,
                ),
                child: GestureDetector(
                  onTapDown: _handleTapDown,
                  onTapUp: _handleTapUp,
                  onTapCancel: _handleTapCancel,
                  onTap: widget.onTap,
                  child: MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                      // height: 200.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: isRTL ? Alignment.centerRight : Alignment.centerLeft,
                          end: isRTL ? Alignment.centerLeft : Alignment.centerRight,
                          colors: [
                            primaryColor,
                            primaryColor.withOpacity(0.85),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            blurRadius: _isPressed ? 8 : _isHovered ? 20 : 15,
                            offset: Offset(0, _isPressed ? 2 : _isHovered ? 8 : 5),
                            spreadRadius: _isPressed ? -2 : 0,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Stack(
                          children: [
                            // Background Pattern/Decoration
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    center: isRTL ? Alignment.centerLeft : Alignment.centerRight,
                                    radius: 1.2,
                                    colors: [
                                      Colors.white.withOpacity(0.1),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Main Content
                            Padding(
                              padding: EdgeInsets.all(24.w),
                              child: Row(
                                children: [
                                  // Left side - Image
                                  if (!isRTL) _buildImageSection(),

                                  // Content Section
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isRTL ? 0 : 20.w,
                                      ),
                                      child: _buildContentSection(secondaryColor),
                                    ),
                                  ),

                                  // Right side - Image (for RTL)
                                  if (isRTL) _buildImageSection(),
                                ],
                              ),
                            ),

                            // Shimmer Effect on Hover
                            if (_isHovered)
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    gradient: LinearGradient(
                                      begin: const Alignment(-1.0, 0.0),
                                      end: const Alignment(1.0, 0.0),
                                      colors: [
                                        Colors.transparent,
                                        Colors.white.withOpacity(0.1),
                                        Colors.transparent,
                                      ],
                                      stops: const [0.0, 0.5, 1.0],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: _isHovered ? 1.0 : 0.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 1.0 + (value * 0.05),
          child: Container(
            width: 120.w,
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 40.sp,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContentSection(Color secondaryColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Section
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, (1 - value) * 20),
              child: Opacity(
                opacity: value,
                child: Text(
                  widget.title,
                  style: TextStyles.titleStyle?.copyWith(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),

        SizedBox(height: 8.h),

        // Subtitle Section
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, (1 - value) * 15),
              child: Opacity(
                opacity: value,
                child: Text(
                  widget.subTitle,
                  style: TextStyles.hintStyle?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),

        SizedBox(height: 16.h),

        // Button Section
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 700),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, (1 - value) * 10),
              child: Opacity(
                opacity: value,
                child: _buildActionButton(secondaryColor),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionButton(Color secondaryColor) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: secondaryColor,
          elevation: _isHovered ? 8 : 4,
          shadowColor: Colors.black.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 12.h,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.buttonText,
              style: TextStyles.errorStyle?.copyWith(
                color: secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(width: 8.w),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 300),
              tween: Tween(begin: 0.0, end: _isHovered ? 1.0 : 0.0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 4, 0),
                  child: Icon(
                    Get.locale!.languageCode == "ar"
                        ? Icons.arrow_forward_ios
                        : Icons.arrow_forward_ios_rounded,
                    size: 16.sp,
                    color: secondaryColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



// class RightHomeCard extends StatelessWidget {
//   final String title, subTitle, buttonText, image;
//   final VoidCallback? onTap;
//   const RightHomeCard({
//     super.key,
//     required this.title,
//     required this.buttonText,
//     required this.image,
//     required this.subTitle,
//     this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SidePadding(
//       sidePadding: 20,
//       child: InkWell(
//         onTap: onTap,
//         child: Stack(
//           alignment: Get.locale!.languageCode == "ar"
//               ? FractionalOffset.centerLeft
//               : FractionalOffset.centerRight,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(15.w),
//               child: Container(
//                 width: screenWidth,
//                 // height: 240.h,
//                 decoration: BoxDecoration(
//                     boxShadow: const [
//                       BoxShadow(
//                         color: white,
//                         // spreadRadius: 5,
//                         // blurRadius: 7,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                     color: mainLightColor,
//                     border: Border.all(color: borderColor),
//                     borderRadius: BorderRadius.circular(5.r)),
//                 child: SidePadding(
//                   sidePadding: 10,
//                   child: SizedBox(
//                     width: screenWidth / 2,
//                     height: 220.h,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                             width: screenWidth / 2,
//                             height: 70.h,
//                             child: Text(title,
//                                 maxLines: 2,
//                                 style: TextStyles.titleStyle
//                                     .copyWith(color: white))),
//                         SizedBox(
//                           width: screenWidth * 0.45,
//                           height: 85.h,
//                           child: Text(subTitle,
//                               maxLines: 3,
//                               softWrap: true,
//                               style: TextStyles.hintStyle
//                                   .copyWith(color: cvColor)),
//                         ),
//                         SizedBox(
//                           // width: screenWidth / 2.5,
//                           child: MasterButton(
//                               onPressed: onTap,
//                               buttonText: buttonText,
//                               buttonRadius: 50.r,
//                               buttonColor: white.withOpacity(0.9),
//                               borderColor: white.withOpacity(0.9),
//                               sidePadding: 0,
//                               buttonWidth: 165.w,
//                               buttonHeight: 65.h,
//                               buttonStyle: TextStyles.errorStyle.copyWith(
//                                   color: cvColor, fontWeight: FontWeight.w700)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Image.asset(
//               image,
//               height: 220.h,
//               width: screenWidth * 0.4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class LeftHomeCard extends StatelessWidget {
//   final String title, subTitle, buttonText, image;
//   final VoidCallback? onTap;
//   const LeftHomeCard(
//       {super.key,
//       required this.title,
//       required this.buttonText,
//       required this.image,
//       required this.subTitle,
//       this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return SidePadding(
//       sidePadding: 0,
//       child: InkWell(
//         onTap: onTap,
//         child: Stack(
//           alignment: Get.locale!.languageCode == "ar"
//               ? FractionalOffset.centerRight
//               : FractionalOffset.centerLeft,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(15.w),
//               child: Container(
//                 width: screenWidth,
//                 height: 220.h,
//                 decoration: BoxDecoration(
//                     color: mainLightColor,
//                     border: Border.all(color: borderColor),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: white,
//                         // spreadRadius: 5,
//                         // blurRadius: 7,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(5.r)),
//                 child: Row(
//                   children: [
//                     const Spacer(),
//                     SidePadding(
//                       sidePadding: 10,
//                       child: SizedBox(
//                         // width: screenWidth * 0.4,
//                         height: 240.h,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                                 width: screenWidth * 0.4,
//                                 height: 70.h,
//                                 child: Text(title,
//                                     maxLines: 2,
//                                     style: TextStyles.titleStyle
//                                         .copyWith(color: white))),
//                             SizedBox(
//                                 width: screenWidth * 0.4,
//                                 height: 85.h,
//                                 child: Text(subTitle,
//                                     maxLines: 3,
//                                     softWrap: true,
//                                     style: TextStyles.hintStyle
//                                         .copyWith(color: cvColor))),
//                             SizedBox(
//                               width: screenWidth / 2.5,
//                               child: MasterButton(
//                                   onPressed: onTap,
//                                   buttonText: buttonText,
//                                   borderColor: white.withOpacity(0.9),
//                                   buttonColor: white.withOpacity(0.9),
//                                   buttonRadius: 50.r,
//                                   sidePadding: 0,
//                                   buttonWidth: 165.w,
//                                   buttonHeight: 65.h,
//                                   buttonStyle: TextStyles.errorStyle.copyWith(
//                                       color: cvColor,
//                                       fontWeight: FontWeight.w700)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Image.asset(
//               image,
//               height: 235.h,
//               width: screenWidth * 0.4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


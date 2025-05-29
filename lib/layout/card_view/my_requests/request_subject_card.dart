import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/res/drawable/icon/icons.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';

import '../../../res/value/style/textstyles.dart';
import '../../../widget/logo/logo/logo.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';
import '../../activity/user_screens/request/course_pay/pay_screen.dart';

class RequestSubjectCard extends StatelessWidget {
  const RequestSubjectCard({
    super.key,
    required this.lessonTitle,
    required this.lessonId,
    required this.id,
    required this.name,
    required this.price,
    required this.onlineCheck,
    required this.acceptanceCheck,
    required this.onTap,
  });

  final String lessonTitle;
  final int id, lessonId;
  final String name;
  final String price;
  final String onlineCheck;
  final String acceptanceCheck;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.12),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Get.to(() => PayScreen(
            type: "lesson",
            id: lessonId,
            isRequest: true,
            requestId: id,
          )),
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                // Main content row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile section with enhanced design
                    _buildProfileSection(),
                    Space(boxWidth: 16.w),
                    // Content section
                    Expanded(
                      child: _buildContentSection(),
                    ),
                  ],
                ),
                Space(boxHeight: 12.h),
                // Bottom section with status and action
                _buildBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        // Enhanced profile avatar
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            gradient: blueGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: mainColor.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.all(4.w),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Logo(
              logoHeight: 72,
              logoWidth: 72,
            ),
          ),
        ),
        Space(boxHeight: 8.h),
        // Request ID chip
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: mainColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: mainColor.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            "#$id",
            style: TextStyles.contentStyle.copyWith(
              color: mainColor,
              fontWeight: FontWeight.w600,
              fontSize: 11.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Lesson title with enhanced typography
        Text(
          lessonTitle,
          style: TextStyles.appBarStyle.copyWith(
            color: blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Space(boxHeight: 8.h),

        // Provider info with icon
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(
                Icons.person_outline,
                size: 14.sp,
                color: textfieldColor,
              ),
            ),
            Space(boxWidth: 8.w),
            Expanded(
              child: Text(
                name,
                style: TextStyles.hintStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Space(boxHeight: 6.h),

        // Price info with enhanced design
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(
                Icons.attach_money,
                size: 14.sp,
                color: Colors.green[700],
              ),
            ),
            Space(boxWidth: 8.w),
            Text(
              "$price ${tr("sar")}",
              style: TextStyles.hintStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.green[700],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.15),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Online badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.blue.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.wifi,
                  size: 12.sp,
                  color: Colors.blue[700],
                ),
                Space(boxWidth: 4.w),
                Text(
                  tr("online"),
                  style: TextStyles.contentStyle.copyWith(
                    color: Colors.blue[700],
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Status badge with dynamic styling
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: _getStatusColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: _getStatusColor().withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getStatusIcon(),
                  size: 12.sp,
                  color: _getStatusColor(),
                ),
                Space(boxWidth: 4.w),
                Text(
                  acceptanceCheck,
                  style: TextStyles.contentStyle.copyWith(
                    color: _getStatusColor(),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Space(boxWidth: 8.w),

          // Action button
          Container(
            height: 32.h,
            child: ElevatedButton(
              onPressed: () => Get.to(() => PayScreen(
                type: "lesson",
                id: lessonId,
                isRequest: true,
                requestId: id,
              )),
              style: ElevatedButton.styleFrom(
                backgroundColor: _getActionButtonColor(),
                foregroundColor: Colors.white,
                elevation: 2,
                shadowColor: _getActionButtonColor().withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getActionIcon(),
                    size: 14.sp,
                  ),
                  Space(boxWidth: 4.w),
                  Text(
                    _getActionText(),
                    style: TextStyles.contentStyle.copyWith(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods for status-based styling
  Color _getStatusColor() {
    switch (acceptanceCheck.toLowerCase()) {
      case "pending":
        return Colors.orange;
      case "accepted":
        return Colors.green;
      case "rejected":
        return Colors.red;
      case "paid":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon() {
    switch (acceptanceCheck.toLowerCase()) {
      case "pending":
        return Icons.schedule;
      case "accepted":
        return Icons.check_circle_outline;
      case "rejected":
        return Icons.cancel_outlined;
      case "paid":
        return Icons.payment;
      default:
        return Icons.info_outline;
    }
  }

  Color _getActionButtonColor() {
    switch (acceptanceCheck.toLowerCase()) {
      case "accepted":
        return Colors.green;
      case "pending":
        return mainColor;
      default:
        return Colors.grey[600]!;
    }
  }

  IconData _getActionIcon() {
    switch (acceptanceCheck.toLowerCase()) {
      case "accepted":
        return Icons.payment;
      case "pending":
        return Icons.visibility;
      default:
        return Icons.info;
    }
  }

  String _getActionText() {
    switch (acceptanceCheck.toLowerCase()) {
      case "accepted":
        return tr("pay_now");
      case "pending":
        return tr("view");
      case "rejected":
        return tr("details");
      case "paid":
        return tr("view");
      default:
        return tr("view");
    }
  }
}

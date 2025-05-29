// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../model/common/notifications/notification_model.dart';
// import '../../../res/value/color/color.dart';
// import '../../../res/value/style/textstyles.dart';
// import '../../../widget/buttons/master/master_button.dart';
// import '../../../widget/space/space.dart';
// import '../../activity/provider_screens/requests_sent/requests_sent_screen.dart';
// import '../../activity/user_screens/request/course_pay/pay_screen.dart';
//
// class NotificationsCard extends StatelessWidget {
//   final NotificationModel data;
//   const NotificationsCard({super.key, required this.data});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           data.text ?? "",
//           style: TextStyles.subTitleStyle.copyWith(color: txtColor),
//         ),
//         Space(
//           boxHeight: 10.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//               textAlign: TextAlign.center,
//               data.createdAt.toString(),
//               style: TextStyles.contentStyle.copyWith(color: timeColor),
//             ),
//           ],
//         ),
//         Space(
//           boxHeight: 5.h,
//         ),
//         data.type == "YourRequestWasAccepted.Course" ||
//                 data.type == "YourRequestWasAccepted.Lesson"
//             ? SizedBox(
//                 height: 60.h,
//                 width: 200.w,
//                 child: MasterButton(
//                   buttonText: tr("go_to_pay"),
//                   buttonColor: mainColor,
//                   borderColor: mainColor,
//                   onPressed: () => Get.to(() => PayScreen(
//                         id: data.objectId,
//                         type: data.type == "YourRequestWasAccepted.Course"
//                             ? "course"
//                             : "lesson",
//                       )),
//                 ),
//               )
//             : data.type == "YouHaveNewRequest.Course" ||
//                     data.type == "YouHaveNewRequest.Lesson"
//                 ? SizedBox(
//                     height: 60.h,
//                     width: 200.w,
//                     child: MasterButton(
//                       buttonText: tr("go_to_request"),
//                       buttonColor: mainColor,
//                       borderColor: mainColor,
//                       onPressed: () => Get.to(() => RequestsSentScreen(
//                             id: data.objectId,
//                             type: data.type == "YouHaveNewRequest.Course"
//                                 ? "course"
//                                 : "lesson",
//                           )),
//                     ),
//                   )
//                 : const SizedBox(),
//         data.type == "YourRequestWasAccepted.Course" ||
//                 data.type == "YourRequestWasAccepted.Lesson" ||
//                 data.type == "YouHaveNewRequest.Course" ||
//                 data.type == "YouHaveNewRequest.Lesson"
//             ? const Space(
//                 boxHeight: 10,
//               )
//             : const SizedBox(),
//         const Divider()
//       ],
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/common/notifications/notification_model.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/buttons/master/master_button.dart';
import '../../../widget/space/space.dart';
import '../../activity/provider_screens/requests_sent/requests_sent_screen.dart';
import '../../activity/user_screens/request/course_pay/pay_screen.dart';

class NotificationsCard extends StatelessWidget {
  final NotificationModel data;
  const NotificationsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with notification icon and timestamp
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Notification type icon
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: _getNotificationColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    _getNotificationIcon(),
                    color: _getNotificationColor(),
                    size: 20.sp,
                  ),
                ),
                Space(boxWidth: 12.w),
                // Notification content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Notification title
                      Text(
                        _getNotificationTitle(),
                        style: TextStyles.subTitleStyle.copyWith(
                          color: txtColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Space(boxHeight: 4.h),
                      // Notification message
                      Text(
                        data.text ?? "",
                        style: TextStyles.contentStyle.copyWith(
                          color: txtColor.withOpacity(0.8),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                // Timestamp
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _formatTimestamp(data.createdAt),
                      style: TextStyles.contentStyle.copyWith(
                        color: timeColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    Space(boxHeight: 2.h),
                    // Status indicator
                    Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: _getStatusColor(),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Action button (if applicable)
            if (_hasAction()) ...[
              Space(boxHeight: 16.h),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48.h,
                      child: MasterButton(
                        buttonText: _getButtonText(),
                        buttonColor: _getNotificationColor(),
                        borderColor: _getNotificationColor(),
                        onPressed: _getButtonAction(),
                      ),
                    ),
                  ),
                  Space(boxWidth: 12.w),
                  // Secondary action button (optional)
                  if (_isRequestNotification()) ...[
                    Expanded(
                      child: SizedBox(
                        height: 48.h,
                        // width: 100.w,
                        child: OutlinedButton(
                          onPressed: _viewDetails,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            tr("view_details"),
                            style: TextStyles.contentStyle.copyWith(
                              color: Colors.grey[600],
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Helper methods for better organization and maintainability

  IconData _getNotificationIcon() {
    switch (data.type) {
      case "YourRequestWasAccepted.Course":
        return Icons.school; // Course icon
      case "YourRequestWasAccepted.Lesson":
        return Icons.book; // Lesson icon
      case "YouHaveNewRequest.Course":
        return Icons.school_outlined; // New course request
      case "YouHaveNewRequest.Lesson":
        return Icons.book_outlined; // New lesson request
      default:
        return Icons.notifications;
    }
  }

  Color _getNotificationColor() {
    switch (data.type) {
      case "YourRequestWasAccepted.Course":
      case "YourRequestWasAccepted.Lesson":
        return mainColor; // Changed from Colors.green to mainColor
      case "YouHaveNewRequest.Course":
      case "YouHaveNewRequest.Lesson":
        return mainColor;
      default:
        return mainColor; // Changed from Colors.blue to mainColor
    }
  }

  Color _getStatusColor() {
    // You can implement read/unread status here
    // For now, using notification color with reduced opacity
    return _getNotificationColor().withOpacity(0.6);
  }

  String _getNotificationTitle() {
    switch (data.type) {
      case "YourRequestWasAccepted.Course":
        return tr("course_request_accepted");
      case "YourRequestWasAccepted.Lesson":
        return tr("lesson_request_accepted");
      case "YouHaveNewRequest.Course":
        return tr("new_course_request");
      case "YouHaveNewRequest.Lesson":
        return tr("new_lesson_request");
      default:
        return tr("notification");
    }
  }

  String _getButtonText() {
    switch (data.type) {
      case "YourRequestWasAccepted.Course":
      case "YourRequestWasAccepted.Lesson":
        return tr("proceed_to_payment");
      case "YouHaveNewRequest.Course":
      case "YouHaveNewRequest.Lesson":
        return tr("view_request");
      default:
        return tr("view");
    }
  }

  VoidCallback? _getButtonAction() {
    switch (data.type) {
      case "YourRequestWasAccepted.Course":
      case "YourRequestWasAccepted.Lesson":
        return () => Get.to(() => PayScreen(
          id: data.objectId,
          type: data.type == "YourRequestWasAccepted.Course" ? "course" : "lesson",
        ));
      case "YouHaveNewRequest.Course":
      case "YouHaveNewRequest.Lesson":
        return () => Get.to(() => RequestsSentScreen(
          id: data.objectId,
          type: data.type == "YouHaveNewRequest.Course" ? "course" : "lesson",
        ));
      default:
        return null;
    }
  }

  bool _hasAction() {
    return [
      "YourRequestWasAccepted.Course",
      "YourRequestWasAccepted.Lesson",
      "YouHaveNewRequest.Course",
      "YouHaveNewRequest.Lesson"
    ].contains(data.type);
  }

  bool _isRequestNotification() {
    return data.type?.contains("Request") ?? false;
  }

  String _formatTimestamp(String? timestamp) {
    if (timestamp == null || timestamp.isEmpty) return "";

    try {
      final dateTime = DateTime.parse(timestamp);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inMinutes < 1) {
        return tr("just_now");
      } else if (difference.inHours < 1) {
        return tr("minutes_ago", args: [difference.inMinutes.toString()]);
      } else if (difference.inDays < 1) {
        return tr("hours_ago", args: [difference.inHours.toString()]);
      } else if (difference.inDays < 7) {
        return tr("days_ago", args: [difference.inDays.toString()]);
      } else {
        return DateFormat('MMM dd, yyyy').format(dateTime);
      }
    } catch (e) {
      // If parsing fails, return the original string
      return timestamp;
    }
  }

  void _viewDetails() {
    // Show detailed notification information in a bottom sheet or dialog
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            Space(boxHeight: 20.h),

            // Title
            Row(
              children: [
                Icon(
                  _getNotificationIcon(),
                  color: _getNotificationColor(),
                  size: 24.sp,
                ),
                Space(boxWidth: 12.w),
                Expanded(
                  child: Text(
                    _getNotificationTitle(),
                    style: TextStyles.subTitleStyle.copyWith(
                      color: txtColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Space(boxHeight: 16.h),

            // Message content
            Text(
              tr("message"),
              style: TextStyles.contentStyle.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
            Space(boxHeight: 8.h),
            Text(
              data.text ?? "",
              style: TextStyles.contentStyle.copyWith(
                color: txtColor,
                height: 1.5,
              ),
            ),
            Space(boxHeight: 16.h),

            // Notification details
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  _buildDetailRow(tr("notification_type"), _getNotificationTypeDisplay()),
                  if (data.objectId != null) ...[
                    Space(boxHeight: 8.h),
                    _buildDetailRow(tr("reference_id"), data.objectId!.toString()),
                  ],
                  Space(boxHeight: 8.h),
                  _buildDetailRow(tr("received_at"), _formatTimestamp(data.createdAt)),
                ],
              ),
            ),
            Space(boxHeight: 20.h),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      tr("close"),
                      style: TextStyles.contentStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                if (_hasAction()) ...[
                  Space(boxWidth: 12.w),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        _getButtonAction()?.call();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getNotificationColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        _getButtonText(),
                        style: TextStyles.contentStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            Space(boxHeight: 20.h),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            label,
            style: TextStyles.contentStyle.copyWith(
              color: Colors.grey[600],
              fontSize: 12.sp,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyles.contentStyle.copyWith(
              color: txtColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  String _getNotificationTypeDisplay() {
    switch (data.type) {
      case "YourRequestWasAccepted.Course":
        return tr("accepted_course_request");
      case "YourRequestWasAccepted.Lesson":
        return tr("accepted_lesson_request");
      case "YouHaveNewRequest.Course":
        return tr("incoming_course_request");
      case "YouHaveNewRequest.Lesson":
        return tr("incoming_lesson_request");
      default:
        return tr("general_notification");
    }
  }
}
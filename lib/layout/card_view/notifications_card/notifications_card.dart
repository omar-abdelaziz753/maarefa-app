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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.text ?? "",
          style: TextStyles.subTitleStyle.copyWith(color: txtColor),
        ),
        Space(
          boxHeight: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textAlign: TextAlign.center,
              data.createdAt.toString(),
              style: TextStyles.contentStyle.copyWith(color: timeColor),
            ),
          ],
        ),
        Space(
          boxHeight: 5.h,
        ),
        data.type == "YourRequestWasAccepted.Course" ||
                data.type == "YourRequestWasAccepted.Lesson"
            ? SizedBox(
                height: 60.h,
                width: 200.w,
                child: MasterButton(
                  buttonText: tr("go_to_pay"),
                  buttonColor: mainColor,
                  borderColor: mainColor,
                  onPressed: () => Get.to(() => PayScreen(
                        id: data.objectId,
                        type: data.type == "YourRequestWasAccepted.Course"
                            ? "course"
                            : "lesson",
                      )),
                ),
              )
            : data.type == "YouHaveNewRequest.Course" ||
                    data.type == "YouHaveNewRequest.Lesson"
                ? SizedBox(
                    height: 60.h,
                    width: 200.w,
                    child: MasterButton(
                      buttonText: tr("go_to_request"),
                      buttonColor: mainColor,
                      borderColor: mainColor,
                      onPressed: () => Get.to(() => RequestsSentScreen(
                            id: data.objectId,
                            type: data.type == "YouHaveNewRequest.Course"
                                ? "course"
                                : "lesson",
                          )),
                    ),
                  )
                : const SizedBox(),
        data.type == "YourRequestWasAccepted.Course" ||
                data.type == "YourRequestWasAccepted.Lesson" ||
                data.type == "YouHaveNewRequest.Course" ||
                data.type == "YouHaveNewRequest.Lesson"
            ? const Space(
                boxHeight: 10,
              )
            : const SizedBox(),
        const Divider()
      ],
    );
  }
}

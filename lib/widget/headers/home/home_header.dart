import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layout/activity/notifications/notifications_screen.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/style/textstyles.dart';
import '../../buttons/notification_button/notification_button.dart';
import '../../space/space.dart';

class HomeHeader extends StatelessWidget {
  final bool isNotify, isUser;
  final dynamic data;

  const HomeHeader(
      {super.key,
      this.isNotify = true,
      required this.isUser,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl: isUser
                ? data.data.user.image
                : data.data.authUser.imagePath ?? "",
            errorWidget: (context, url, error) => const SizedBox(),
            imageBuilder: (context, imageProvider) => Container(
              margin: const EdgeInsets.all(8.0),
              height: 50,
              width: 50,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Space(
          boxWidth: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(tr("welcome_back"), style: TextStyles.textView20Bold),
              Text(
                  isUser
                      ? " ${data.data.user.firstName} ${data.data.user.lastName} "
                      : " ${data.data.authUser.title} ${data.data.authUser.firstName} ${data.data.authUser.lastName} ",
                  overflow: TextOverflow.clip,
                  style: TextStyles.textView16SemiBold
                      .copyWith(color: primaryText)),
            ],
          ),
        ),
        const SizedBox(width: 20),
        NotificationButton(
          count: data.notificationsCount,
          onTap: () => isUser
              ? Get.to(const NotificationsScreen(isUser: true))
              : Get.to(const NotificationsScreen(isUser: false)),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

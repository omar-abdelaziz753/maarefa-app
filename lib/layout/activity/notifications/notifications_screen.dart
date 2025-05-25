import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/layout/view/notifications/notifications_provider_view.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import '../../view/connectivity/connectivity_view.dart';
import '../../view/notifications/notifications_user_view.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key, required this.isUser});
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("notifications")),
      body: ConnectivityView(
        child: SidePadding(
            sidePadding: 35,
            child: isUser
                ? const NotificationsUserView()
                : const NotificationsProviderView()),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_academy/layout/view/connectivity/connectivity_view.dart';

import '../../../../view/subscribers/subscribers_view.dart';

class SubscribersScreen extends StatelessWidget {
  final int id;
  const SubscribersScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ConnectivityView(child: SubscribersView(id: id));
  }
}

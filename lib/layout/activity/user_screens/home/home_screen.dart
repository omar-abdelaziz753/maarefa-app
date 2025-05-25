import 'package:flutter/material.dart';

import '../../../../res/value/color/color.dart';
import '../../../view/connectivity/connectivity_view.dart';
import '../../../view/home/user/user_home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: white,
      body: ConnectivityView(child: UserHomeView()),
    );
  }
}

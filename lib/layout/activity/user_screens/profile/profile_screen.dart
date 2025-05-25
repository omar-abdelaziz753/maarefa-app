import 'package:flutter/material.dart';

import '../../../../res/value/color/color.dart';
import '../../../view/profile/profile/profile_view.dart';

class ProfileScreen extends StatelessWidget {
  final bool isUser;
  const ProfileScreen({super.key, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ProfileView(
        isUser: isUser,
      ),
    );
  }
}

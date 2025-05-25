import 'package:flutter/material.dart';

import '../../res/drawable/image/images.dart';
import '../../res/value/dimenssion/dimenssions.dart';

class BackgroundImage extends StatelessWidget {
  final String? image;
  final Widget child;
  const BackgroundImage({super.key, required this.child, this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        alignment: FractionalOffset.center,
        children: [
          Image.asset(
            image ?? backgroundImage,
            height: screenHeight,
            width: screenWidth,
            fit: BoxFit.fill,
          ),
          child,
        ],
      ),
    );
  }
}

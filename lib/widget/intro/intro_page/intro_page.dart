import 'package:flutter/material.dart';

import '../../../res/value/dimenssion/dimenssions.dart';
import '../../side_padding/side_padding.dart';
import '../../space/space.dart';

class IntroPage extends StatelessWidget {
  final String subject, image, title;
  final TextStyle style;
  final TextStyle titleStyle;

  const IntroPage({
    super.key,
    required this.image,
    required this.subject,
    required this.style,
    required this.titleStyle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      // height: screenHeight * 0.5,
      child: SidePadding(
        sidePadding: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 0.35 * screenHeight,
              width: screenWidth,
              fit: BoxFit.contain,
            ),
            Space(
              boxHeight: 0.2 * screenHeight,
            ),
            Text(title,
                softWrap: true, textAlign: TextAlign.center, style: titleStyle),
            const Space(
              boxHeight: 5,
            ),
            SizedBox(
              child: Text(subject,
                  overflow: TextOverflow.clip, softWrap: true, style: style),
            ),
          ],
        ),
      ),
    );
  }
}

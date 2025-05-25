import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';

import '../../res/drawable/icon/icons.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  BottomSheetWidgetState createState() => BottomSheetWidgetState();
}

class BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                elevation: 20,
                context: context,
                builder: (context) {
                  return SidePadding(
                    sidePadding: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                circleXmark,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          tr("sort_by"),
                          style: TextStyles.introStyle.copyWith(color: black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr("top_rated"),
                              style: TextStyles.introStyle
                                  .copyWith(color: mainColor),
                            ),
                            Image.asset(
                              trueIcon,
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr("most_wanted"),
                              style:
                                  TextStyles.hintStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr("lowest_price"),
                              style:
                                  TextStyles.hintStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr("highest_price"),
                              style:
                                  TextStyles.hintStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  );
                });
          },
          child: const Text(
            'Click Me',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6),
          ),
        ),
      ),
    );
  }
}

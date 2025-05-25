import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';
import 'package:my_academy/widget/textfield/master/master2_textfiled.dart';

class QuestionAlertMessege extends StatefulWidget {
  const QuestionAlertMessege({super.key});

  @override
  State<QuestionAlertMessege> createState() => _QuestionAlertMessegeState();
}

class _QuestionAlertMessegeState extends State<QuestionAlertMessege> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Simple Alert Dialog'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AdvanceCustomAlert();
                });
          },
        ),
      ),
    );
  }
}

class AdvanceCustomAlert extends StatelessWidget {
  const AdvanceCustomAlert({
    super.key,
    this.onTap,
    this.controller,
  });
  final VoidCallback? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 300,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      tr("rejection"),
                      style: TextStyles.headerStyle
                          .copyWith(color: black, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Master2TextField(
                      controller: controller,
                      hintText: tr("reason_rejection"),
                      fieldHeight: 115,
                      maxLines: 5,
                      minLines: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MasterButton(
                      buttonText: tr("send"),
                      buttonHeight: 55,
                      onPressed: onTap,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: white,
                  radius: 60,
                  child: Image.asset(
                    question,
                    height: 130,
                    width: 100,
                  ),
                )),
          ],
        ));
  }
}

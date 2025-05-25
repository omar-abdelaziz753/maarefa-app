import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

class DownloadCertificate extends StatelessWidget {
  const DownloadCertificate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: Icon(
          Icons.close,
          color: black,
          size: 40.h,
        ),
      ),
      body: SidePadding(
        sidePadding: 30,
        child: Column(
          children: [
            const Space(
              boxHeight: 100,
            ),
            Image.asset(certificateImage),
            const Space(
              boxHeight: 50,
            ),
            Text(
              tr("Course_finished"),
              style: TextStyles.loginTitleStyle.copyWith(color: black),
            ),
            const Space(
              boxHeight: 20,
            ),
            Text(
              tr("successfully"),
              style: TextStyles.loginTitleStyle
                  .copyWith(color: profileBackgroundColor),
            ),
            const Space(
              boxHeight: 50,
            ),
            MasterButton(
              onPressed: () {},
              buttonText: tr("main"),
              buttonColor: profileColor,
              borderColor: profileColor,
              buttonStyle: TextStyles.appBarStyle.copyWith(color: secColor),
            ),
            const Space(
              boxHeight: 20,
            ),
            MasterButton(
              onPressed: () {},
              buttonText: tr("download_certificate"),
              // buttonStyle: TextStyles.appBarStyle.copyWith(color: white),
            ),
          ],
        ),
      ),
    );
  }
}

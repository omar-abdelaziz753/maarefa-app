import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/provider_screens/account_data/specialization_screen.dart';
import 'package:my_academy/layout/activity/user_screens/cv/cv_url_screen.dart';

import '../../../../model/provider/provider/provider_model.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../card_view/profile_card/profile_card.dart';
import '../certificate/certificate_screen.dart';
import '../main/main_screen.dart';
import 'about_you_screen.dart';
import 'account_data_screen.dart';
import 'grades_screen.dart';

class EditAccountInformation extends StatelessWidget {
  final Provider data;
  const EditAccountInformation({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const ProviderMainScreen());
        return false;
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: tr("edit_account_information"),
          backPressed: () => Get.offAll(() => const ProviderMainScreen()),
        ),
        body: ListView(
          children: [
            ProfileCard(
              pressed: () {
                Get.to(() => AccountDataScreen(
                      isUser: false,
                      user: data,
                    ));
              },
              title: tr("account_information"),
              subTitle: tr("image_name_date"),
            ),
            ProfileCard(
                pressed: () => Get.to(() => AboutYouScreen(data: data)),
                title: tr("about_provider"),
                subTitle: data.bio),
            ProfileCard(
                pressed: () => Get.to(() => SpecializationScreen(data: data)),
                title: tr("specification"),
                subTitle: "${data.specializations![0].name} ${tr("etc")}"),
            ProfileCard(
                pressed: () => Get.to(() => GradesScreen(data: data)),
                title: tr("grades"),
                subTitle: data.educationalStages!.isEmpty
                    ? ""
                    : "${data.educationalStages![0].name} ${tr("etc")}"),
            ProfileCard(
              pressed: () => Get.to(() => CvScreen(data: data)),
              title: tr("cv_url"),
            ),
            ProfileCard(
              pressed: () => Get.to(() => const CertificateScreen()),
              title: tr("certificate"),
            ),
          ],
        ),
      ),
    );
  }
}

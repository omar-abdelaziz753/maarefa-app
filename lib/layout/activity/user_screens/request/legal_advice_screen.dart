import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_academy/layout/activity/user_screens/success_booking/booking_success.dart';
import 'package:my_academy/layout/card_view/payment_card/payment_card.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../card_view/request_summery_details_card.dart/request_advice_detaile_card.dart';
import '../../../card_view/reserved_appointments_card/reserved_appointments_card.dart';

class RequsetSummary extends StatefulWidget {
  const RequsetSummary({super.key});

  @override
  State<RequsetSummary> createState() => _RequsetSummaryState();
}

class _RequsetSummaryState extends State<RequsetSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr("requset_summary")),
      body: SidePadding(
        sidePadding: 30,
        child: ListView(
          children: [
            const AdviceDetailsCard(),
            const Space(
              boxHeight: 30,
            ),
            const Divider(
              thickness: 1,
            ),
            // const DiscountCodeCard(),
            const Space(
              boxHeight: 30,
            ),
            const PaymentCard(),
            const Space(
              boxHeight: 30,
            ),
            const Divider(
              thickness: 1,
            ),
            const ReservedAppointmentsCard(),
            const Space(
              boxHeight: 30,
            ),
            MasterButton(
              buttonText: tr("pay"),
              onPressed: () {
                Get.to(() => const BookingStatus());
              },
            ),
            const Space(
              boxHeight: 30,
            ),
          ],
        ),
      ),
    );
  }
}

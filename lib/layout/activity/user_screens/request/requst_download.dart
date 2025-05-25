import 'package:easy_localization/easy_localization.dart';
// import 'package:pdfdownload/pdfdownload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_academy/bloc/download_certificate/download_certificate_cubit.dart';
import 'package:my_academy/layout/card_view/request_summery_details_card.dart/request_course_details_card.dart';
import 'package:my_academy/layout/card_view/table_from_to_card/table_card.dart';
import 'package:my_academy/model/user/subscriptions/subscribe_course/subscribe_course_model.dart';
import 'package:my_academy/res/drawable/image/images.dart';
import 'package:my_academy/res/value/color/color.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/buttons/master/master_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../../widget/alert/alert_rate.dart';
import '../../static/contact_us/contact_us_screen.dart';

class RequsetAndDownload extends StatelessWidget {
  const RequsetAndDownload({super.key, required this.data});
  final SubscriptionCourse data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: ""),
      body: SidePadding(
        sidePadding: 30,
        child: BlocProvider(
          create: (context) => DownloadCertificateCubit(),
          child:
              BlocBuilder<DownloadCertificateCubit, DownloadCertificateState>(
            builder: (context, state) {
              final bloc = DownloadCertificateCubit.get(context);
              return ListView(
                children: [
                  RequstCourseDetailsCard(courseDetailsModel: data.course),
                  const Space(boxHeight: 30),
                  const Divider(
                    thickness: 1,
                  ),
                  Text(
                    tr("reserved_group"),
                    style: TextStyles.appBarStyle.copyWith(color: black),
                  ),
                  const Space(
                    boxHeight: 20,
                  ),
                  Column(
                    children: List.generate(data.groups!.length,
                        (index) => TableCard(data: data.groups![index])),
                  ),
                  const Space(
                    boxHeight: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Text(
                    data.certificated == true
                        ? tr("passing_course")
                        : tr("certificate_not_available"),
                    style: TextStyles.appBarStyle.copyWith(color: black),
                  ),
                  const Space(
                    boxHeight: 30,
                  ),
                  data.certificated == true
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () => bloc.download(data.certificatePath!),
                              child: Image.asset(
                                certificate,
                                fit: BoxFit.fill,
                                height: 175.h,
                                width: 100.w,
                              ),
                            ),
                            const Space(
                              boxHeight: 30,
                            ),
                            // DownloandPdf(
                            //   pdfUrl: widget.data!.certificatePath!,
                            //   fileNames: 'certificate.pdf',
                            //   color: mainColor,
                            // ),
                            const Space(
                              boxHeight: 30,
                            ),
                            MasterButton(
                              onPressed: () =>
                                  bloc.download(data.certificatePath!),
                              buttonText: tr("download_certificate"),
                              // buttonStyle:
                              //     TextStyles.appBarStyle.copyWith(color: mainColor),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  const Space(
                    boxHeight: 30,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(tr("rate_note"),
                            style: TextStyles.subTitleStyle
                                .copyWith(color: Colors.black)),
                      ),
                      TextButton(
                          onPressed: () =>
                              Get.to(() => const ContactUsScreen()),
                          child: Text(tr("from_here"),
                              style: TextStyles.subTitleStyle))
                    ],
                  ),
                  const SizedBox(height: 15),
                  MasterButton(
                    buttonText: tr("rate"),
                    buttonColor: Colors.amber,
                    borderColor: Colors.amber,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return RateAlert(
                              id: data.course.provider.id,
                              type: 'provider',
                            );
                          });
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

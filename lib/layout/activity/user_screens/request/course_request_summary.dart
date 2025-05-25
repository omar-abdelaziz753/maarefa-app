import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/model/common/courses/course_details/course_details_model.dart';
import 'package:my_academy/model/user/groups_courses/groups_courses_model.dart';
import 'package:my_academy/res/value/style/textstyles.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/buttons/master_load/master_load_button.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';
import '../../../../bloc/add_request/add_request_cubit.dart';
import '../../../../res/value/color/color.dart';
import '../../../card_view/request_summery_details_card.dart/request_course_details_card.dart';
import '../../../card_view/table_from_to_card/table_card.dart';

class RequestCourseScreen extends StatelessWidget {
  const RequestCourseScreen(
      {super.key,
      required this.courseDetailsModel,
      required this.group,
      required this.id});
  final CourseDetailsModel courseDetailsModel;
  final GroupModel group;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AddRequestCubit(),
        child: BlocConsumer<AddRequestCubit, AddRequestState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = AddRequestCubit.get(context);
              return Scaffold(
                appBar: DefaultAppBar(title: tr("requset_summary")),
                body: SidePadding(
                  sidePadding: 30,
                  child: ListView(
                    children: [
                      RequstCourseDetailsCard(
                          courseDetailsModel: courseDetailsModel),
                      const Space(
                        boxHeight: 20,
                      ),
                      // const Divider(
                      //   thickness: 1,
                      // ),
                      // const DiscountCodeCard(),
                      // const Space(
                      //   boxHeight: 30,
                      // ),
                      // const PaymentCard(),
                      const Space(
                        boxHeight: 30,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Text(
                        tr("reserved_appointments"),
                        style: TextStyles.appBarStyle.copyWith(color: black),
                      ),
                      const Space(
                        boxHeight: 20,
                      ),
                      TableCard(data: group),
                      const Space(
                        boxHeight: 30,
                      ),
                      MasterLoadButton(
                        buttonController: bloc.authController,
                        buttonText: tr("send_request"),
                        onPressed: () {
                          bloc.addRequestCourse(
                              courseId: id, groupId: group.id!);
                          // Get.to(const BookingStatus());
                        },
                      ),
                      // BlocProvider(
                      //   create: (context) => PayCubit(),
                      //   child: BlocConsumer<PayCubit, PayState>(
                      //     listener: (context, state) {},
                      //     builder: (context, state) {
                      //       final bloc = PayCubit.get(context);
                      //       return MasterLoadButton(
                      //         buttonController: bloc.payController,
                      //         buttonText: "${tr("pay")} ($total)",
                      //         onPressed: () {
                      //           bloc.pay(id: courseDetailsModel.id!, context: context);
                      //           // Get.to(const BookingStatus());
                      //         },
                      //       );
                      //     },
                      //   ),
                      // ),
                      const Space(
                        boxHeight: 30,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

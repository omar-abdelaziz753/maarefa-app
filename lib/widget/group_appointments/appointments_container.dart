import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/bloc/add_request/add_request_cubit.dart';
import 'package:my_academy/model/common/courses/course_details/course_details_model.dart';
import 'package:my_academy/widget/buttons/master_load/master_load_button.dart';
import 'package:my_academy/widget/loader/loader.dart';

import '../../model/user/groups_courses/groups_courses_model.dart';
import '../../res/drawable/image/images.dart';
import '../../res/value/color/color.dart';
import '../../res/value/dimenssion/dimenssions.dart';
import '../../res/value/style/textstyles.dart';
import '../space/space.dart';

class AppointmentsContainer extends StatelessWidget {
  const AppointmentsContainer(
      {super.key,
      required this.data,
      this.courseDetailsModel,
      this.isUser = true});
  final GroupModel data;
  final CourseDetailsModel? courseDetailsModel;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRequestCubit(),
      child: BlocConsumer<AddRequestCubit, AddRequestState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = AddRequestCubit.get(context);
            if (state is AddRequestLoading) {
              return const Loading();
            }
            return Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: profileColor,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    color: profileColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr("start_from"),
                          style: TextStyles.hintStyle,
                        ),
                        const Space(
                          boxWidth: 5,
                        ),
                        Text(
                          DateFormat("yyyy-MM-dd", "en").format(
                              DateTime.parse(data.startFrom.toString())),
                          style: TextStyles.hintStyle.copyWith(color: black),
                        ),
                        const Space(
                          boxWidth: 20,
                        ),
                        Text(
                          tr("for"),
                          style: TextStyles.hintStyle,
                        ),
                        const Space(boxWidth: 5),
                        Text(
                          "${data.duration!.number} ${data.duration!.type}",
                          style: TextStyles.hintStyle.copyWith(color: black),
                        ),
                      ],
                    ),
                  ),
                  const Space(
                    boxHeight: 5,
                  ),
                  Container(
                    height: 40,
                    color: profileColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr("start_from"),
                          style: TextStyles.hintStyle,
                        ),
                        const Space(
                          boxWidth: 5,
                        ),
                        Text(
                          data.start?.time ?? "",
                          style: TextStyles.hintStyle.copyWith(color: black),
                        ),
                        const Space(
                          boxWidth: 20,
                        ),
                        Text(
                          tr("to"),
                          style: TextStyles.hintStyle,
                        ),
                        const Space(boxWidth: 5),
                        Text(
                          data.end?.time ?? "",
                          style: TextStyles.hintStyle.copyWith(color: black),
                        ),
                      ],
                    ),
                  ),
                  const Space(
                    boxHeight: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              data.start!.dayOfWeek,
                              // "السبت",
                              style: TextStyles.hintStyle
                                  .copyWith(color: mainColor),
                            ),
                            const Space(
                              boxHeight: 5,
                            ),
                            Text(
                              DateFormat("yyyy-MM-dd", "en").format(
                                  DateTime.parse(data.start!.date.toString())),
                              // "22/1/2022",
                              style: TextStyles.hintStyle
                                  .copyWith(color: mainColor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Image.asset(lineImage),
                            Text(
                              data.start!.times.map((e) => e).toString()
                              // "كل سبت و تلات و خميس"
                              ,
                              style: TextStyles.hintStyle
                                  .copyWith(color: mainColor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              data.end!.dayOfWeek
                              // "السبت"
                              ,
                              style: TextStyles.hintStyle
                                  .copyWith(color: mainColor),
                            ),
                            const Space(
                              boxHeight: 5,
                            ),
                            Text(
                              DateFormat("yyyy-MM-dd", "en").format(
                                  DateTime.parse(data.end!.date.toString())),
                              style: TextStyles.hintStyle
                                  .copyWith(color: mainColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Space(
                    boxHeight: 20,
                  ),
                  isUser
                      ? MasterLoadButton(
                          buttonController: bloc.authController,
                          onPressed: () {
                            bloc.validateCourseRequest(
                                courseId: courseDetailsModel!.id!,
                                groupId: data.id!,
                                courseDetailsModel: courseDetailsModel!,
                                groupModel: data);
                          },
                          sidePadding: 0,
                          buttonWidth: screenWidth,
                          buttonText: tr("book_appointment"),
                        )
                      : const SizedBox(),
                  const Space(
                    boxHeight: 20,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

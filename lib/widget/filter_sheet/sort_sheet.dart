import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/lessons/lessons_cubit.dart';
import '../../res/drawable/icon/icons.dart';
import '../../res/value/color/color.dart';
import '../../res/value/style/textstyles.dart';
import '../side_padding/side_padding.dart';
import '../space/space.dart';

// import '../../../layouts/view/filter/filter_view.dart';
// import '../../../res/values/dimenssion/screenutil.dart';

showSortAction(
    {BuildContext? context,
    String? sort,
    VoidCallback? closeTap,
    VoidCallback? minPrice,
    VoidCallback? maxPrice,
    VoidCallback? rateTap,
    VoidCallback? orderedTap}) {
  showModalBottomSheet<void>(
      context: context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: BlocProvider.value(
            value: BlocProvider.of<LessonsCubit>(context),
            child: BlocConsumer<LessonsCubit, LessonsState>(
              listener: (context, state) {},
              builder: (context, state) {
                // final bloc = LessonsCubit.get(context);
                return SizedBox(
                  height: 350.h,
                  child: SidePadding(
                    sidePadding: 15,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              tr("sort_by"),
                              style: TextStyles.appBarStyle
                                  .copyWith(color: black, fontSize: 20),
                            ),
                            const Space(
                              boxWidth: 100,
                            ),
                            InkWell(
                                onTap: closeTap,
                                child: Image.asset(circleXmark)),
                          ],
                        ),
                        const Space(
                          boxHeight: 40,
                        ),
                        TextButton(
                          onPressed: minPrice,
                          child: Text(tr("min_price"),
                              style: sort == "minPrice"
                                  ? TextStyles.textView20Bold
                                  : TextStyles.textView16Regular),
                        ),
                        TextButton(
                          onPressed: maxPrice,
                          child: Text(tr("max_price"),
                              style: sort == "maxPrice"
                                  ? TextStyles.textView20Bold
                                  : TextStyles.textView16Regular),
                        ),
                        TextButton(
                          onPressed: rateTap,
                          child: Text(tr("rate"),
                              style: sort == "rate"
                                  ? TextStyles.textView20Bold
                                  : TextStyles.textView16Regular),
                        ),
                        TextButton(
                          onPressed: orderedTap,
                          child: Text(tr("most_ordered"),
                              style: sort == "mostOrdered"
                                  ? TextStyles.textView20Bold
                                  : TextStyles.textView16Regular),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/home/home_cubit.dart';
import '../../../repository/provider/home/home_repository.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';
import '../../../widget/error/page/error_page.dart';
import '../../../widget/image_handler/image_from_network/network_image.dart';
import '../../../widget/loader/loader.dart';
import '../../../widget/master_list/custom_list.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});
  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            HomeCubit(HomeRepository())..getOffers(),
        child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is OffersLoadedState) {
                final data = state.data;
                return offersView(context, data);
              } else if (state is OffersErrorState) {
                return const ErrorPage();
              } else {
                return const Loading();
              }
            }));
  }

  offersView(context, data) {
    return ListView(
      children: [
        CustomList(
          child: (context, index) => SidePadding(
              sidePadding: 15,
              child: Column(
                children: [
                  const Space(
                    boxHeight: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.h),
                          color: cvBackgroundColor
                        ),
                        child: CachedImage(
                          imageUrl: data![index].image!,
                          width: 90.w,
                          height: 90.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SidePadding(
                        sidePadding: 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data![index].name!,
                                style: TextStyles.textView14SemiBold),
                            SizedBox(
                              width: screenWidth * 2 / 3,
                              child: Text(data![index].content!,
                                  // maxLines: 1,
                                  softWrap: true,
                                  style: TextStyles.hintStyle),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Space(
                    boxHeight: 10,
                  ),
                  const Divider(),
                ],
              )),
          axis: Axis.vertical,
          listHeight: screenHeight,
          count: data.length,
          scroll: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

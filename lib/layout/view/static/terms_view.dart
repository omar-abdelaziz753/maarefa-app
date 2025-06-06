import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/static/static_screens_cubit.dart';
import '../../../model/static_pages/static_page/static_screens_model.dart';
import '../../../repository/static_pages/static_page/static_page_repository.dart';
import '../../../res/drawable/image/images.dart';
import '../../../widget/error/page/error_page.dart';
import '../../../widget/loader/loader.dart';
import '../../../widget/side_padding/side_padding.dart';
import '../../../widget/space/space.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key, required this.isUser});
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            StaticScreensCubit(StaticScreensRepository())
              ..getTerms(isUser: isUser),
        child: BlocConsumer<StaticScreensCubit, StaticScreensState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder<StaticScreensCubit, StaticScreensState>(
                  builder: (context, state) {
                if (state is TermsLoadedState) {
                  final data = (state).data;
                  return termsView(context: context, data: data);
                } else if (state is TermsErrorState) {
                  return const ErrorPage();
                } else {
                  return const Loading();
                }
              });
            }));
  }

  termsView({
    required BuildContext context,
    required StaticScreensModel data,
  }) {
    return SidePadding(
      sidePadding: 15,
      child: ListView(
        children: [
          const Space(
            boxHeight: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(terms)),
                ),
              ),
              Space(
                boxHeight: 10.h,
              ),
            ],
          ),
          Space(boxHeight: 10.h),
          SingleChildScrollView(
            child: Html(
              data: data.content!,
              // style: TextStyles.agreeStyle,
            ),
          ),
          const Space(
            boxHeight: 100,
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/res/value/style/textstyles.dart';

import '../../../bloc/subscribers/subscribers_cubit.dart';
import '../../../repository/subscribers/subscribers_repository.dart';
import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../widget/app_bar/default_app_bar/subscribers_app_bar.dart';
import '../../../widget/error/page/error_page.dart';
import '../../../widget/loader/loader.dart';
import '../../../widget/master_list/custom_list.dart';
import '../../../widget/subscribers/subscribers_items.dart';

class SubscribersView extends StatelessWidget {
  final int id;
  const SubscribersView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            SubscribersCubit(SubscribersRepository())..getSubscribers(id),
        child: BlocConsumer<SubscribersCubit, SubscribersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder<SubscribersCubit, SubscribersState>(
                builder: (context, state) {
                  // final bloc = SubscribersCubit.get(context);
                  if (state is SubscribersLoadedState) {
                    final data = (state).data;
                    return yearsView(context, data);
                  } else if (state is SubscribersErrorState) {
                    return const Scaffold(
                        backgroundColor: white, body: ErrorPage());
                  } else {
                    return const Scaffold(
                        backgroundColor: white, body: Loading());
                  }
                },
              );
            }));
  }

  yearsView(context, data) {
    return BlocProvider(
        create: (BuildContext context) =>
            SubscribersCubit(SubscribersRepository())..initSubscriber(data),
        child: BlocConsumer<SubscribersCubit, SubscribersState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = SubscribersCubit.get(context);
              bloc.initSubscriber(data);
              return Scaffold(
                  appBar: SubscribersAppBar(
                      title: tr("subscribers"),
                      title2:
                          "${bloc.subscriberModel!.length} ${tr("subscriber")}"),
                  body: ListView(
                    children: [
                      Text(
                        tr("certificate_note2"),
                        style: TextStyles.textView16Bold,
                      ),
                      const SizedBox(height: 10),
                      CustomList(
                        child: (context, index) => SubscribersItems(
                            data: bloc.subscriberModel![index]),
                        axis: Axis.vertical,
                        listHeight: screenHeight,
                        count: bloc.subscriberModel!.length,
                        scroll: const NeverScrollableScrollPhysics(),
                      ),
                    ],
                  ));
            }));
  }
}

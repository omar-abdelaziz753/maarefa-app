import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/layout/card_view/card_contact/card_contact.dart';
import 'package:my_academy/model/provider/requests/requests_model/requests_model.dart';
import 'package:my_academy/repository/provider/requests/requests_repository.dart';
import 'package:my_academy/res/value/dimenssion/dimenssions.dart';
import 'package:my_academy/widget/alert/question_alert.dart';
import 'package:my_academy/widget/app_bar/default_app_bar/default_app_bar.dart';
import 'package:my_academy/widget/loader/loader.dart';
import 'package:my_academy/widget/master_list/custom_list.dart';
import 'package:my_academy/widget/side_padding/side_padding.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../../bloc/provider_requests/provider_requests_cubit.dart';

class RequestsSentScreen extends StatelessWidget {
  const RequestsSentScreen({super.key, required this.type, required this.id});
  final int id;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: tr("request_sent")),
        body: BlocProvider(
          create: (BuildContext context) =>
              ProviderRequestsCubit(RequestsProvider())
                ..showRequestsDetails(type, id),
          child: BlocConsumer<ProviderRequestsCubit, ProviderRequestsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocBuilder<ProviderRequestsCubit, ProviderRequestsState>(
                  builder: (context, state) {
                if (state is ProviderShowRequestsLoadingState &&
                        state.isFirstFetch ||
                    state is ProviderShowRequestsInitial) {
                  return const Loading();
                }
                List<Request> data = [];
                if (state is ProviderShowRequestsLoadingState) {
                  data = state.requests;
                } else if (state is ProviderShowRequestsLoadedState) {
                  data = state.data;
                }
                return requestsView(data);
              });
            },
          ),
        ));
  }

  requestsView(List<Request> data) {
    return BlocProvider(
        create: (context) =>
            ProviderRequestsCubit(RequestsProvider())..initDetails(data),
        child: BlocBuilder<ProviderRequestsCubit, ProviderRequestsState>(
            builder: (context, state) {
          final bloc = ProviderRequestsCubit.get(context);
          return SidePadding(
              sidePadding: 30,
              child: CustomList(
                listHeight: 1000000000000000,
                listWidth: screenWidth,
                scroll: const NeverScrollableScrollPhysics(),
                axis: Axis.vertical,
                count: bloc.requestModel.isEmpty
                    ? data.length
                    : bloc.requestModel.length,
                child: (context, index) => Column(
                  children: [
                    Space(
                      boxHeight: 10.h,
                    ),
                    CardContact(
                        acceptController: bloc.acceptController,
                        rejectController: bloc.rejectControl,
                        acceptTap: () =>
                          bloc.acceptRequest(bloc.requestModel.isEmpty
                              ? data[index].id!
                              : bloc.requestModel[index].id!),
                        
                        rejectTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AdvanceCustomAlert(
                                controller: bloc.rejectController,
                                onTap: () =>
                                  bloc.rejectRequest(
                                      bloc.requestModel.isEmpty
                                          ? data[index].id!
                                          : bloc.requestModel[index].id!,
                                      type),
                              );
                            },
                          );
                        },
                        data: bloc.requestModel.isEmpty
                            ? data[index]
                            : bloc.requestModel[index]),
                  ],
                ),
              ));
        }));
  }
}

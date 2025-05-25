import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/layout/view/connectivity/connectivity_view.dart';
import 'package:my_academy/layout/view/provider_appointments/provider_coming_appointments.dart';
import 'package:my_academy/layout/view/provider_appointments/provider_finished_appointments.dart';
import 'package:my_academy/widget/space/space.dart';
import '../../../../bloc/provider_appointments/provider_appointments_cubit.dart';
import '../../../../widget/buttons/filter/filter_button.dart';
import '../../../../widget/filter_sheet/appointment_filter_sheet.dart';
import '../../../view/provider_appointments/provider_appointment_view.dart';

class ProviderAppointmentsScreen extends StatelessWidget {
  const ProviderAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ProviderAppointmentsCubit>(context),
      child: BlocConsumer<ProviderAppointmentsCubit, ProviderAppointmentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = ProviderAppointmentsCubit.get(context);
          return ConnectivityView(
            child: Scaffold(
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: !bloc.isSubject
                    ? FilterButton(
                        onTap: () => showAppointmentAction(context, 'course'))
                    : FilterButton(
                        onTap: () => showAppointmentAction(context, 'lesson')),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const Space(
                      boxHeight: 5,
                    ),
                    bloc.status == "finished"
                        ? const ProviderFinishedAppointments(
                            status: "finished",
                          )
                        : bloc.status == ""
                            ? const ProviderAppointments(status: "")
                            : const ProviderComingAppointments(
                                status: "comming"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

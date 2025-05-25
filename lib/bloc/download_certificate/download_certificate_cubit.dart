import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

part 'download_certificate_state.dart';

class DownloadCertificateCubit extends Cubit<DownloadCertificateState> {
  DownloadCertificateCubit() : super(DownloadCertificateInitial());
  static DownloadCertificateCubit get(BuildContext context) =>
      BlocProvider.of(context);

  download(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
    emit(ShowPDFState());
  }
}

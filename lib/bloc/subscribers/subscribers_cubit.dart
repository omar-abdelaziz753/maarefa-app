import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../model/subscribers/subscribers_model.dart';
import '../../repository/subscribers/subscribers_repository.dart';

part 'subscribers_state.dart';

class SubscribersCubit extends Cubit<SubscribersState> {
  SubscribersCubit(this.subscribersRepository) : super(SubscribersInitial());
  static SubscribersCubit get(BuildContext context) => BlocProvider.of(context);
  SubscribersRepository subscribersRepository;

  RoundedLoadingButtonController subscriberController =
      RoundedLoadingButtonController();

  List<SubscribersModel>? subscriberModel;

  bool success = false;

  initSubscriber(data) {
    subscriberModel = data;
    emit(InitSubscriberState());
  }

  getSubscribers(int id) {
    subscribersRepository.getSubscribers(id).then((value) {
      subscriberModel = value.data;
      emit(SubscribersLoadedState(data: value.data));
    });
  }

  sendCertificate(int id, int request, int client) {
    subscribersRepository.sendCertificate(id, request, client).then((value) {
      subscriberController.reset();
      subscriberModel = value.data;
      // subscriberController.reset();
      emit(SendCertificateState());
    }).onError((error, stackTrace) async {
      subscriberController.reset();
    });
  }

  uploadePDFCertificate(int id, int request, int client) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      final PlatformFile cerPlatformFile = result.files.first;
      File cerFile = File(cerPlatformFile.path ?? "");
      subscribersRepository
          .sendPDFCertificate(id, request, client, cerFile)
          .then((value) {
        subscriberController.reset();
        subscriberModel = value.data;
        emit(SendCertificateState());
      });
    } else {
      subscriberController.reset();
    }
  }
}

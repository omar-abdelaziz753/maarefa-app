import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/model/static_pages/static_page/static_screens_model.dart';
import 'package:my_academy/repository/static_pages/static_page/static_page_repository.dart';

part 'static_screens_state.dart';

class StaticScreensCubit extends Cubit<StaticScreensState> {
  StaticScreensRepository staticPageRepository;
  StaticScreensCubit(this.staticPageRepository) : super(StaticScreensInitial());

  static StaticScreensRepository get(BuildContext context) =>
      BlocProvider.of(context);

  getTerms({required bool isUser}) {
    staticPageRepository.terms(isUser: isUser).then((value) {
      emit(TermsLoadedState(data: value.data));
    });
  }

  getPrivacy() {
    staticPageRepository.privacy().then((value) {
      emit(PrivacyLoadedState(data: value.data));
    });
  }

  getAboutUs() {
    staticPageRepository.about().then((value) {
      emit(AboutUsLoadedState(data: value.data));
    });
  }

  // contactUs() {
  //   staticPageRepository.contactUs().whenComplete(() {
  //     contactUsController.reset();
  //   });
  //   emit(ContactUsLoaded());
  // }
}

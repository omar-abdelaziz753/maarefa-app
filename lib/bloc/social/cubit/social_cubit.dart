import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:my_academy/model/socail.dart';
import 'package:my_academy/widget/toast/toast.dart';

import '../../../repository/common/socail/socail_repository.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit(this.socialRepository) : super(SocialInitial());

  final SocialRepository socialRepository;

  SocialResponse? contactUsResponse;

  Map<String, String> socailMediaIcon = {
    "twitter": "assets/icons/twitter.png",
    "instagram": "assets/icons/instagram.png",
    "tiktok": "assets/icons/tiktok.png",
    "facebook": "assets/icons/facebook.png",
    "snapchat-ghost": "assets/icons/snapchat.png",
    "telegram": "assets/icons/telegram.png",
    "youtube": "assets/icons/youtube.png",
    "email": "assets/icons/email.png",
    "phone": "assets/icons/telephone.png",
    "mobile": "assets/icons/telephone.png",
    "fax": "assets/icons/fax.png",
    "mail": "assets/icons/gmail.png",
    "address": "assets/icons/address.png",
    "whatsapp": "assets/icons/whatsapp.png",
    "google": "assets/icons/google.png",
    "linkedIn": "assets/icons/linkedin.png",
  };
  Map<String, String> socailLinks = {};
  Future<void> fGetSocial() async {
    emit(SocialLoading());
    final failOrSuccess = await socialRepository.getSocial();
    failOrSuccess.fold((l) {
      showToast(tr("connection_message"));
    }, (socail) {
      contactUsResponse = socail;
      emit(SocialSuccess(socialResponse: socail));
    });
  }
}

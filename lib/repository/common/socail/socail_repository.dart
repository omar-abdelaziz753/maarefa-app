import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_academy/failure.dart';

import '../../../model/socail.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class SocialRepository {
  Future<Either<Failure, SocialResponse>> getSocial() async {
    try {
      SocialResponse? socialResponse;
      final response = await DioService().get('/social');
      response.fold((l) => showToast(l), (r) {
        socialResponse = SocialResponse.fromJson(r);
      });
      return right(socialResponse!);
    } catch (e) {
      debugPrint(e.toString());
      return left(Failure());
    }
  }
}

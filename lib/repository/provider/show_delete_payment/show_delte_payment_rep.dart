import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../service/network/dio/dio_service.dart';

class ShowDeleteRepo {
  Future<bool> getDeleteStatus() async {
    try {
      final resposne = await DioService().post('/client/delete-status', body: {
        "version": "2.0.2",
      }) as Either;
      return resposne.fold<bool>((l) => false, (r) {
        return r["data"]["message"] == 1;
      });
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
